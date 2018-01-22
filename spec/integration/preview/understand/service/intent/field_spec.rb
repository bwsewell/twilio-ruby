##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

require 'spec_helper.rb'

describe 'Field' do
  it "can fetch" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.preview.understand.services("UAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                                .intents("UDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                                .fields("UEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa").fetch()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://preview.twilio.com/understand/Services/UAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Intents/UDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Fields/UEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "url": "https://preview.twilio.com/understand/Services/UAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Intents/UDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Fields/UEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "unique_name": "unique_name",
          "date_updated": "2015-07-30T20:00:00Z",
          "service_sid": "UAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "intent_sid": "UDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "2015-07-30T20:00:00Z",
          "sid": "UEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "field_type": "field_type"
      }
      ]
    ))

    actual = @client.preview.understand.services("UAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                                       .intents("UDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                                       .fields("UEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa").fetch()

    expect(actual).to_not eq(nil)
  end

  it "can read" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.preview.understand.services("UAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                                .intents("UDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                                .fields.list()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://preview.twilio.com/understand/Services/UAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Intents/UDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Fields',
    ))).to eq(true)
  end

  it "receives read_empty responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "fields": [],
          "meta": {
              "page": 0,
              "first_page_url": "https://preview.twilio.com/understand/Services/UAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Intents/UDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Fields?PageSize=50&Page=0",
              "url": "https://preview.twilio.com/understand/Services/UAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Intents/UDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Fields?PageSize=50&Page=0",
              "key": "fields",
              "next_page_url": null,
              "previous_page_url": null,
              "page_size": 50
          }
      }
      ]
    ))

    actual = @client.preview.understand.services("UAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                                       .intents("UDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                                       .fields.list()

    expect(actual).to_not eq(nil)
  end

  it "receives read_full responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "fields": [
              {
                  "url": "https://preview.twilio.com/understand/Services/UAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Intents/UDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Fields/UEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "unique_name": "unique_name",
                  "date_updated": "2015-07-30T20:00:00Z",
                  "service_sid": "UAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "intent_sid": "UDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "date_created": "2015-07-30T20:00:00Z",
                  "sid": "UEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "field_type": "field_type"
              }
          ],
          "meta": {
              "page": 0,
              "first_page_url": "https://preview.twilio.com/understand/Services/UAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Intents/UDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Fields?PageSize=50&Page=0",
              "url": "https://preview.twilio.com/understand/Services/UAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Intents/UDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Fields?PageSize=50&Page=0",
              "key": "fields",
              "next_page_url": null,
              "previous_page_url": null,
              "page_size": 50
          }
      }
      ]
    ))

    actual = @client.preview.understand.services("UAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                                       .intents("UDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                                       .fields.list()

    expect(actual).to_not eq(nil)
  end

  it "can create" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.preview.understand.services("UAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                                .intents("UDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                                .fields.create(field_type: "field_type", unique_name: "unique_name")
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {'FieldType' => "field_type", 'UniqueName' => "unique_name", }
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://preview.twilio.com/understand/Services/UAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Intents/UDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Fields',
        data: values,
    ))).to eq(true)
  end

  it "receives create responses" do
    @holodeck.mock(Twilio::Response.new(
        201,
      %q[
      {
          "url": "https://preview.twilio.com/understand/Services/UAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Intents/UDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Fields/UEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "unique_name": "unique_name",
          "date_updated": "2015-07-30T20:00:00Z",
          "service_sid": "UAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "intent_sid": "UDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "2015-07-30T20:00:00Z",
          "sid": "UEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "field_type": "field_type"
      }
      ]
    ))

    actual = @client.preview.understand.services("UAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                                       .intents("UDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                                       .fields.create(field_type: "field_type", unique_name: "unique_name")

    expect(actual).to_not eq(nil)
  end

  it "can delete" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.preview.understand.services("UAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                                .intents("UDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                                .fields("UEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa").delete()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'delete',
        url: 'https://preview.twilio.com/understand/Services/UAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Intents/UDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Fields/UEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
    ))).to eq(true)
  end

  it "receives delete responses" do
    @holodeck.mock(Twilio::Response.new(
        204,
      nil,
    ))

    actual = @client.preview.understand.services("UAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                                       .intents("UDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                                       .fields("UEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa").delete()

    expect(actual).to eq(true)
  end
end