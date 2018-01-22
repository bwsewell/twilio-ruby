##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

module Twilio
  module REST
    class Preview < Domain
      class Wireless < Version
        class SimContext < InstanceContext
          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class UsageList < ListResource
            ##
            # Initialize the UsageList
            # @param [Version] version Version that contains the resource
            # @param [String] sim_sid The sim_sid
            # @return [UsageList] UsageList
            def initialize(version, sim_sid: nil)
              super(version)

              # Path Solution
              @solution = {sim_sid: sim_sid}
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Preview.Wireless.UsageList>'
            end
          end

          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class UsagePage < Page
            ##
            # Initialize the UsagePage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @return [UsagePage] UsagePage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of UsageInstance
            # @param [Hash] payload Payload response from the API
            # @return [UsageInstance] UsageInstance
            def get_instance(payload)
              UsageInstance.new(@version, payload, sim_sid: @solution[:sim_sid], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Preview.Wireless.UsagePage>'
            end
          end

          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class UsageContext < InstanceContext
            ##
            # Initialize the UsageContext
            # @param [Version] version Version that contains the resource
            # @param [String] sim_sid The sim_sid
            # @return [UsageContext] UsageContext
            def initialize(version, sim_sid)
              super(version)

              # Path Solution
              @solution = {sim_sid: sim_sid, }
              @uri = "/Sims/#{@solution[:sim_sid]}/Usage"
            end

            ##
            # Fetch a UsageInstance
            # @param [String] end_ The end
            # @param [String] start The start
            # @return [UsageInstance] Fetched UsageInstance
            def fetch(end_: :unset, start: :unset)
              params = Twilio::Values.of({'End' => end_, 'Start' => start, })

              payload = @version.fetch(
                  'GET',
                  @uri,
                  params,
              )

              UsageInstance.new(@version, payload, sim_sid: @solution[:sim_sid], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Preview.Wireless.UsageContext #{context}>"
            end
          end

          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class UsageInstance < InstanceResource
            ##
            # Initialize the UsageInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] sim_sid The sim_sid
            # @return [UsageInstance] UsageInstance
            def initialize(version, payload, sim_sid: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'sim_sid' => payload['sim_sid'],
                  'sim_unique_name' => payload['sim_unique_name'],
                  'account_sid' => payload['account_sid'],
                  'period' => payload['period'],
                  'commands_usage' => payload['commands_usage'],
                  'commands_costs' => payload['commands_costs'],
                  'data_usage' => payload['data_usage'],
                  'data_costs' => payload['data_costs'],
                  'url' => payload['url'],
              }

              # Context
              @instance_context = nil
              @params = {'sim_sid' => sim_sid, }
            end

            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @return [UsageContext] UsageContext for this UsageInstance
            def context
              unless @instance_context
                @instance_context = UsageContext.new(@version, @params['sim_sid'], )
              end
              @instance_context
            end

            ##
            # @return [String] The sim_sid
            def sim_sid
              @properties['sim_sid']
            end

            ##
            # @return [String] The sim_unique_name
            def sim_unique_name
              @properties['sim_unique_name']
            end

            ##
            # @return [String] The account_sid
            def account_sid
              @properties['account_sid']
            end

            ##
            # @return [Hash] The period
            def period
              @properties['period']
            end

            ##
            # @return [Hash] The commands_usage
            def commands_usage
              @properties['commands_usage']
            end

            ##
            # @return [Hash] The commands_costs
            def commands_costs
              @properties['commands_costs']
            end

            ##
            # @return [Hash] The data_usage
            def data_usage
              @properties['data_usage']
            end

            ##
            # @return [Hash] The data_costs
            def data_costs
              @properties['data_costs']
            end

            ##
            # @return [String] The url
            def url
              @properties['url']
            end

            ##
            # Fetch a UsageInstance
            # @param [String] end_ The end
            # @param [String] start The start
            # @return [UsageInstance] Fetched UsageInstance
            def fetch(end_: :unset, start: :unset)
              context.fetch(end_: end_, start: start, )
            end

            ##
            # Provide a user friendly representation
            def to_s
              values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Preview.Wireless.UsageInstance #{values}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Preview.Wireless.UsageInstance #{values}>"
            end
          end
        end
      end
    end
  end
end