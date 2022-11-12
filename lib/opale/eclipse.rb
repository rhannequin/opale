# frozen_string_literal: true

require "json"

module Opale
  class Eclipse
    HOST = "https://opale.imcce.fr"
    PATH = "/api/v1/phenomena/eclipses/10/"

    def self.get(date_str)
      uri = URI(HOST + date_str)
      JSON
        .parse(Net::HTTP.get(uri), object_class: OpenStruct)
        .response
        .data
        .first
    end
  end
end
