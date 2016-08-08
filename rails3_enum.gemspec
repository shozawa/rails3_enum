# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails3_enum/version'

Gem::Specification.new do |spec|
  spec.name          = "rails3_enum"
  spec.version       = Rails3Enum::VERSION
  spec.authors       = ["Tomohisa Kuranari"]
  spec.email         = ["m.qureana@gmail.com"]
  spec.summary       = %q{Provide ActiveRecord::Enum for Rails3}
  spec.description   = %q{Provide ActiveRecord::Enum for Rails3}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "activerecord", "= 4.0.13"
  spec.add_dependency 'activesupport', '= 4.0.13'
  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'rspec', '~> 3.1'
  spec.add_development_dependency 'fuubar', '~> 2.1'
  spec.add_development_dependency 'sqlite3'
end
