# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'uddf/version'

Gem::Specification.new do |spec|
  spec.name          = 'UDDF'
  spec.version       = UDDF::VERSION
  spec.authors       = ['Donovan C. Young']
  spec.email         = ['dyoung522@gmail.com']
  spec.summary       = 'Provides methods to create a valid UDDF document'
  spec.description   = spec.summary
  spec.homepage      = 'https://github.com/ScubaGeek/uddf'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = [ lib ]

  spec.add_dependency 'nokogiri'

  spec.add_development_dependency 'bundler', '~> 1.5'
  spec.add_development_dependency 'rake'
end
