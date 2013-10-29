# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'walkon/version'

Gem::Specification.new do |spec|
  spec.name          = "walkon"
  spec.version       = Walkon::VERSION
  spec.authors       = ["Tom Scott"]
  spec.email         = ["tubbo@psychedeli.ca"]
  spec.description   = %q{Play your entrance music}
  spec.summary       = %q{Play your entrance music}
  spec.homepage      = "http://github.com/tubbo/walkon"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)

  spec.files         = Dir["{bin,lib,spec}/**/*", "README.md", "Rakefile"]
  spec.executables   = Dir["bin/*"].map { |f| File.basename(f) }
  spec.test_files    = Dir["spec/**/*"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rspec"
end
