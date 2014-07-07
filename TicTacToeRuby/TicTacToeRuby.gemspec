# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'TicTacToeRuby/version'

Gem::Specification.new do |spec|
  spec.name          = "TicTacToeRuby"
  spec.version       = TicTacToeRuby::VERSION
  spec.authors       = ["Tom McGee"]
  spec.email         = ["tmmcgee13@aol.com"]
  spec.summary       = "TicTacToe Engine written in ruby"
  spec.description   = 
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep('spec')
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
