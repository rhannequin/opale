# frozen_string_literal: true

require "faraday"
require "json"

module Opale
  class Eclipse
    HOST = "https://opale.imcce.fr"
    PATH = "/api/v1/phenomena/eclipses/10/"

    def self.get(date_str)
      conn = Faraday.new(
        url: HOST,
        headers: {"Content-Type": "application/json"}
      )

      response = conn.get(PATH + date_str)
      JSON.parse(response.body, object_class: OpenStruct).response.data.first
    end
  end
end
