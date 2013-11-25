# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nypl/branches_api/version'

Gem::Specification.new do |spec|
  spec.name          = "nypl-branches_api"
  spec.version       = Nypl::BranchesApi::VERSION
  spec.authors       = ["Sean Redmond"]
  spec.email         = ["github-smr@sneakemail.com"]
  spec.description   = %q{NYPL Branches API}
  spec.summary       = %q{NYPL Branches API}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_dependency "sequel"
  spec.add_dependency "sinatra"
  spec.add_dependency "sinatra-jsonp"
end
