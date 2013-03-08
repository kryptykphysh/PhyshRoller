Gem::Specification.new do |s|
  s.name         = "physh_roller"
  s.version      = "0.0.1"
  s.author       = "Kryptyk Fysh"
  s.email        = "kryptykfysh@kryptykfysh.co.uk"
  s.homepage     = "https://github.com/kryptykfysh/PhyshRoller"
  s.summary      = "A dice rolling application"
  s.description  = File.read(File.join(File.dirname(__FILE__), 'README'))
  s.LICENSE      = 'MIT'

  s.files         = Dir["{bin,lib,spec,doc,features}/**/*"] + %w(LICENSE README)
  s.test_files    = Dir["spec/**/*"]
  s.executables   = [ 'dice' ]

  s.required_ruby_version = '>=1.9'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'cucumber'
end