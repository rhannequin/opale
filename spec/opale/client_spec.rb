# frozen_string_literal: true

require "spec_helper"

RSpec.describe Opale::Client do
  describe "::eclipse" do
    it "request the Opale API" do
      body = "301"
      date_str = "2016-09-01"
      url = described_class::HOST + described_class::ECLIPSE_PATH + body + "/" + date_str

      stub_request(:get, url).to_return(
        status: 200,
        body: {
          "response" => {
            "data" => [
              "calendarDate" => date_str
            ]
          }
        }.to_json
      )

      expect(described_class.eclipse(body, date_str).calendarDate).to eq(date_str)
    end
  end
end
