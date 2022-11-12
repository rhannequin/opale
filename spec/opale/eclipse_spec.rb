# frozen_string_literal: true

require "spec_helper"

RSpec.describe Opale::Eclipse do
  describe "::get" do
    it "request the Opale API" do
      date_str = "2022-01-01"

      stub_request(
        :get,
        described_class::HOST + described_class::PATH + date_str
      ).to_return(
        status: 200,
        body: {
          "response" => {
            "data" => [
              "calendarDate" => date_str
            ]
          }
        }.to_json
      )

      expect(described_class.get(date_str).calendarDate).to eq(date_str)
    end
  end
end
