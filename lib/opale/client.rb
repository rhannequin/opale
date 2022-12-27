# frozen_string_literal: true

require "faraday"
require "faraday/middleware"

module Opale
  class Client
    BASE_URL = "https://opale.imcce.fr/api/v1/"

    attr_reader :adapter

    def initialize(adapter: Faraday.default_adapter)
      @adapter = adapter
    end

    def connection
      @connection ||= Faraday.new do |conn|
        conn.url_prefix = BASE_URL
        conn.request :json
        conn.response :json, content_type: "application/json"
        conn.adapter adapter
      end
    end
  end
end
