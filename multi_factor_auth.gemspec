# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'multi_factor_auth/version'

Gem::Specification.new do |spec|
  spec.name          = "multi_factor_auth"
  spec.version       = MultiFactorAuth::VERSION
  spec.authors       = ["cfanbase"]
  spec.email         = ["cfanbase@gmail.com"]

  spec.summary       = "Two-factor authentication"
  spec.description   = "A ruby library for generating one time passwords and QR Codes"
  spec.homepage      = "https://github.com/cfanbase/multi_factor_auth"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "base32", "~> 0.3.2"
  spec.add_dependency "rotp", "~> 3.1.0"
  spec.add_dependency "rqrcode", "~> 0.10.1"
  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "awesome_print"
  spec.add_development_dependency "pry"
end
