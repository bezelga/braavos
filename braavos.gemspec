$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "braavos/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "braavos"
  s.version     = Braavos::VERSION
  s.authors     = ["Fabiano Beselga"]
  s.email       = ["fabianobeselga@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Braavos."
  s.description = "TODO: Description of Braavos."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 4.2.3"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
end
