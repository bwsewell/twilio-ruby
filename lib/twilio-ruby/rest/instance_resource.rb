module Twilio
  module REST
    ##
    # A class to wrap an instance resource (like a call or application) within
    # the Twilio API. All other instance resource classes within this library
    # inherit from this class. You shouldn't need to instantiate this class
    # directly. But reviewing the available methods is informative since they
    # are rarely overridden in the inheriting class.
    class InstanceResource
      include Utils
      attr_accessor :path
      VERBS = [:update, :delete]

      class << self
        def can(*allowed_verbs)
          allowed_verbs.each do |v|
            unless VERBS.include?(v)
              raise "InstanceResource has no verb named #{v.to_s}"
            end

            self.send :alias_method, v, 'internal_'+v.to_s
          end
        end
      end

      ##
      # Instantiate a new instance resource object. You must pass the +path+ of
      # the instance (e.g. /2010-04-01/Accounts/AC123/Calls/CA456) as well as a
      # +client+ object that responds to #get #post and #delete. This client
      # is meant to be an instance of Twilio::REST::Client but could just as
      # well be a mock object if you want to test the interface. The optional
      # +params+ hash will be converted into attributes on the instantiated
      # object.
      def initialize(client, params = {})
        @client = client
        set_up_properties_from params
      end

      def inspect # :nodoc:
        "<#{self.class} @path=#{@path}>"
      end

      def path(new_path)
        @path = new_path
      end

      ##
      # Refresh the attributes of this instance resource object by fetching it
      # from Twilio. Calling this makes an HTTP GET request to <tt>@path</tt>.
      def refresh
        raise "Can't refresh a resource without a REST Client" unless @client
        @updated = false
        set_up_properties_from(@client.get(@path))
        self
      end

      ##
      # Lazily load attributes of the instance resource by waiting to fetch it
      # until an attempt is made to access an unknown attribute.
      def method_missing(method, *args)
        super if @updated
        set_up_properties_from(@client.get(@path))
        self.send method, *args
      end

      protected

      ##
      # Update the properties of this instance resource using the key/value
      # pairs in +params+. This makes an HTTP POST request to <tt>@path</tt>
      # to handle the update. For example, to update the +VoiceUrl+ of a Twilio
      # Application you could write:
      #
      #   @app.update voice_url: 'http://my.other.app.com/handle_voice'
      #
      # After returning, the object will contain the most recent state of the
      # instance resource, including the newly updated properties.
      def internal_update(params = {})
        raise "Can't update a resource without a REST Client" unless @client
        set_up_properties_from(@client.post(@path, params))
        self
      end

      ##
      # Delete an instance resource from Twilio. This operation isn't always
      # supported. For instance, you can't delete an SMS. Calling this method
      # makes an HTTP DELETE request to <tt>@path</tt>.
      def internal_delete
        raise "Can't delete a resource without a REST Client" unless @client
        @client.delete @path
      end

      def set_up_properties_from(hash)
        eigenclass = class << self; self; end
        hash.each do |p,v|
          property = detwilify p
          unless ['client', 'updated'].include? property
            eigenclass.send :define_method, property.to_sym, &lambda { v }
            instance_variable_set("@#{property}", v)
          end
        end
        @updated = !hash.keys.empty?
      end
    end
  end
end
