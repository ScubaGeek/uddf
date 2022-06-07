lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "uddf/versions"

Gem::Specification.new do |spec|
  spec.name          = "UDDF"
  spec.version       = UDDF::VERSION
  spec.authors       = ["Donovan C. Young"]
  spec.email         = ["dyoung522@gmail.com"]
  spec.summary       = "Provides methods to create a valid UDDF document"
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/ScubaGeek/uddf"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = [lib]
  spec.required_ruby_version = "3.1.2"

  spec.add_dependency "ox"

  spec.add_development_dependency "bundler", "~> 2.3"
  spec.add_development_dependency "rake"
  spec.metadata["rubygems_mfa_required"] = "true"
end
