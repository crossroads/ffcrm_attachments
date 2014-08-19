$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ffcrm_attachments/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ffcrm_attachments"
  s.version     = FfcrmAttachments::VERSION
  s.authors     = ["Simon Pang"]
  s.email       = [""]
  s.homepage    = "https://github.com/simonpang/ffcrm_attachments"
  s.summary     = "Summary of FfcrmAttachments."
  s.description = "Add file attachments to CRM"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["LICENSE", "Rakefile", "README.md"]

  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 3.2.14"
  #s.add_dependency "fat_free_crm"
  s.add_dependency "paperclip"
  s.add_dependency 'simple_form', '~> 2.0.1'
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "pg"
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'ffaker'
end
