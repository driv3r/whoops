$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "whoops/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "whoops"
  s.version     = Whoops::VERSION
  s.authors     = ["Daniel Higginbotham","Leszek Zalewski"]
  s.email       = ["daniel@flyingmachinestudios.com","pb.zalewski.leszek@gmail.com"]
  s.homepage    = "http://www.whoopsapp.com"
  s.summary     = "A Rails engine which receives logs and provides an interface for them"
  s.description = "A Rails engine which receives logs and provides an interface for them"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.asciidoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency('rails', '~> 3')
  s.add_dependency('sass')
  s.add_dependency('haml')
  s.add_dependency('mongo')
  s.add_dependency('mongoid', '~>2.4')
  s.add_dependency('kaminari')

  # jquery-rails is used by the dummy application
  s.add_dependency('jquery-rails')

  s.add_development_dependency('rspec-rails')
  s.add_development_dependency('fabrication')
  s.add_development_dependency('faker')
  s.add_development_dependency('capybara', '>= 0.4.0')
end
