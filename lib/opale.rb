# frozen_string_literal: true

require_relative "opale/version"

module Opale
  autoload :Client, "opale/client"
  autoload :Collection, "opale/collection"
  autoload :Error, "opale/error"
  autoload :Object, "opale/object"

  autoload :Eclipse, "opale/phenomenon/eclipse"
end
