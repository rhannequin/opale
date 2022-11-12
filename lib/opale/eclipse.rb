# frozen_string_literal: true
# typed: strict

require "json"
require "net/http"
require "sorbet-runtime"

module Opale
  class Eclipse
    extend T::Sig

    HOST = "https://opale.imcce.fr/api/v1/phenomena/eclipses/10/"

    sig { params(date_str: String).returns(T::Hash[T.untyped, T.untyped]) }
    def self.get(date_str)
      uri = URI(HOST + date_str)
      JSON.parse(Net::HTTP.get(uri))["response"]["data"].first
    end
  end
end
