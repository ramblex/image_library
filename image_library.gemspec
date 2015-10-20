$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "image_library/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "image_library"
  s.version     = ImageLibrary::VERSION
  s.authors     = ["Alex Duller"]
  s.email       = ["alexd@afterthoughtsoftware.com"]
  s.homepage    = "https://github.com/ramblex/image_library"
  s.summary     = "Image Library for Rails"
  s.description = "Image Library for Rails"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.3"
  s.add_dependency "kaminari", "~> 0.16.1"
  s.add_dependency "carrierwave", "~> 0.10.0"
  s.add_dependency "mini_magick", "~> 4.3.6"
  s.add_dependency "jquery-fileupload-rails", "~> 0.4.1"

  s.add_development_dependency "pg"
  s.add_development_dependency "pundit"
  s.add_development_dependency "jquery-rails"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "bootstrap-sass", "~> 3.3.3"
  s.add_development_dependency "sass-rails", ">= 3.2"
end
