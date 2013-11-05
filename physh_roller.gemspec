Gem::Specification.new do |s|
  s.name         = "physh_roller"
  s.version      = "1.1.1"
  s.author       = "Kryptyk Fysh"
  s.email        = "kryptykfysh@kryptykfysh.co.uk"
  s.homepage     = "https://github.com/kryptykfysh/PhyshRoller"
  s.summary      = "A dice rolling application"
  s.description  = <<-EOF
    A Ruby code dice rolling application that can be used both as a
    standalone commandline application, and also mixed in to other 
    applications as a module.
  EOF
  s.license      = 'MIT'

  s.files         = Dir["{bin,lib}/**/*"] + %w(LICENSE README)
  s.test_files    = Dir["spec/**/*"]
  s.executables   = [ 'dice' ]
  s.bindir        = 'bin'
  s.post_install_message = 'Thanks for installing PhyshRoller!'

  s.required_ruby_version = '>=1.9.0'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'cucumber'
end