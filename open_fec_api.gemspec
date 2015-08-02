# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'open_fec_api/version'

Gem::Specification.new do |spec|
  spec.name          = "open_fec_api"
  spec.version       = OpenFecApi::VERSION
  spec.authors       = ["MJ Rossetti (@s2t2)"]
  spec.email         = ["s2t2mail@gmail.com"]
  spec.summary       = %q{A ruby wrapper for Open Federal Elections Commission API (https://api.open.fec.gov/).}
  spec.description   = %q{A ruby wrapper for Open Federal Elections Commission API (https://api.open.fec.gov/). Makes requests to the "candidates" endpoint.}
  spec.homepage      = "https://github.com/debate-watch/open-fec-api-ruby/"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.1"
  spec.add_development_dependency "pry", "~> 0.10"
  spec.add_development_dependency "yard"
  spec.add_dependency "httparty", "~> 0.13"
end
