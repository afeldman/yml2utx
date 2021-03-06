# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yml2utx/version'

Gem::Specification.new do |spec|
  spec.name          = "yml2utx"
  spec.version       = Yml2utx::VERSION
  spec.authors       = ["anton feldmann"]
  spec.email         = ["anton.feldmann@gmail.com"]

  spec.summary       = %q{build fanuc robot language files given a yaml file.}
  spec.description   = %q{this Project uses a yaml file to build the utx file for the fanuc robot contoller. the utx file contains the dictionary information for a specific language.}
  spec.homepage      = "http://github.com/afeldman/yml2utx"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "No special needs"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
