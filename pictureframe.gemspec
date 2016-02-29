# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pictureframe/version'

Gem::Specification.new do |spec|
  spec.name          = "pictureframe"
  spec.version       = Pictureframe::VERSION
  spec.authors       = ["Cody Palmer"]
  spec.email         = ["teampalmer.apps@gmail.com"]

  spec.summary       = %q{The gem that makes debug statements easy to spot and formatted well.}
  spec.description   = %q{The gem that makes debug statements easy to spot and framed in an easy-to-spot picture frame!}
  spec.homepage      = "http://www.github.com/cdpalmer"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "3.3.0"
  spec.add_development_dependency "logger", "1.2.8"
end
