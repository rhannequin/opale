# frozen_string_literal: true

require "faraday"
require "json"

module Opale
  class Client
    HOST = "https://opale.imcce.fr"
    API_VERSION = "v1"
    PATH = "/api/#{API_VERSION}"
    ECLIPSE_PATH = "#{PATH}/phenomena/eclipses/"

    def self.eclipse(body, date_str)
      new.eclipse(body, date_str)
    end

    def eclipse(body, date_str)
      get_request(ECLIPSE_PATH + body + "/" + date_str)
    end

    private

    def get_request(path)
      conn = Faraday.new(
        url: HOST,
        headers: {"Content-Type": "application/json"}
      )

      response = conn.get(path)
      JSON.parse(response.body, object_class: OpenStruct).response.data.first
    end
  end
end
