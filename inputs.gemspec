# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'inputs/version'

Gem::Specification.new do |spec|
  spec.name          = "inputs"
  spec.version       = Inputs::VERSION
  spec.authors       = ["Tomas Valent"]
  spec.email         = ["equivalent@eq8.eu"]

  spec.summary       = %q{Pointless Gem for creating console input interfaces}
  spec.description   = %q{Stupid pointless gem for lazy Ruby developer to implement console interfaces for input fields like y/n questions, names, ...  }
  spec.homepage      = "https://github.com/equivalent/inputs"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "colorize"
  spec.add_development_dependency "bundler", "~> 1.11"
end
