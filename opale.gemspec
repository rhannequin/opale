# frozen_string_literal: true

require_relative "lib/opale/version"

Gem::Specification.new do |spec|
  spec.name = "imcce_opale"
  spec.version = Opale::VERSION
  spec.authors = ["Rémy Hannequin"]
  spec.email = ["hello@rhannequ.in"]

  spec.summary = "IMCCE Opale API Ruby client"
  spec.description = "Ruby Client for the IMCCE Opale API."
  spec.homepage = "https://github.com/rhannequin/opale"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.7.6"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "rake", "~> 13.0"
  spec.add_dependency "rspec", "~> 3.2"

  spec.add_development_dependency "prettier", "~> 2.0"
  spec.add_development_dependency "standard", "~> 1.3"
  spec.add_development_dependency "webmock", "~> 3.18"
end
