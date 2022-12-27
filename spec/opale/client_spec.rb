# frozen_string_literal: true

require "spec_helper"

RSpec.describe Opale::Client do
  describe "#connection" do
    it "request the Opale API" do
      body = "301"
      date_str = "2016-09-01"
      path = "phenomena/eclipses/#{body}/#{date_str}"

      stub_request(:get, described_class::BASE_URL + path).to_return(
        status: 200,
        body: {
          "response" => {"data" => [{"calendarDate" => date_str}]}
        }.to_json
      )

      expect { described_class.new.connection.get(path) }.not_to raise_error
    end
  end
end
