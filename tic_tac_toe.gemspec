Gem::Specification.new do |s|
  s.version       = '0.1.0'
  s.name          = "tic_tac_toe"
  s.authors       = ["Tom McGee"]
  s.email         = ["tmmcgee13@aol.com"]
  s.summary       = "TicTacToe Engine written in ruby"
  #s.homepage      =


  s.files         += %w(README.md)
  s.files         += Dir.glob("lib/**/*")
  s.files         += Dir.glob("spec/**/*")

  s.add_development_dependency "bundler", "~> 1.6"
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
end
