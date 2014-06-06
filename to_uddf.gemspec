# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'to_uddf/version'

Gem::Specification.new do |spec|
  spec.name          = "to_UDDF"
  spec.version       = UDDF::VERSION
  spec.authors       = ["Donovan C. Young"]
  spec.email         = ["dyoung522@gmail.com"]
  spec.summary       = %q{Provides a Hash#to_uddf method to convert Hash into UDDF XML}
  spec.description   = %q{}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
