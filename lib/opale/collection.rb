# frozen_string_literal: true

module Opale
  class Collection
    attr_reader :data

    def self.from_response(response, type:)
      data = response.body.dig("response", "data")
      new(data: data.map { |attrs| type.new(attrs) })
    end

    def initialize(data:)
      @data = data
    end
  end
end
