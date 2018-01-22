##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

require 'spec_helper.rb'

describe 'SegmentMembership' do
  it "can create" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.notify.v1.services("ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                       .users("NUaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                       .segment_memberships.create(segment: "segment")
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {'Segment' => "segment", }
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://notify.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Users/NUaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SegmentMemberships',
        data: values,
    ))).to eq(true)
  end

  it "receives create responses" do
    @holodeck.mock(Twilio::Response.new(
        201,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "identity": "identity",
          "segment": "segment",
          "service_sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "url": "https://notify.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Users/identity/SegmentMemberships/segment"
      }
      ]
    ))

    actual = @client.notify.v1.services("ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                              .users("NUaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                              .segment_memberships.create(segment: "segment")

    expect(actual).to_not eq(nil)
  end

  it "can delete" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.notify.v1.services("ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                       .users("NUaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                       .segment_memberships("segment").delete()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'delete',
        url: 'https://notify.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Users/NUaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SegmentMemberships/segment',
    ))).to eq(true)
  end

  it "receives delete responses" do
    @holodeck.mock(Twilio::Response.new(
        204,
      nil,
    ))

    actual = @client.notify.v1.services("ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                              .users("NUaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                              .segment_memberships("segment").delete()

    expect(actual).to eq(true)
  end

  it "can fetch" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.notify.v1.services("ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                       .users("NUaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                       .segment_memberships("segment").fetch()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://notify.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Users/NUaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SegmentMemberships/segment',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "identity": "identity",
          "segment": "segment",
          "service_sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "url": "https://notify.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Users/identity/SegmentMemberships/segment"
      }
      ]
    ))

    actual = @client.notify.v1.services("ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                              .users("NUaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                              .segment_memberships("segment").fetch()

    expect(actual).to_not eq(nil)
  end
end