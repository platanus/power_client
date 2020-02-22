$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem"s version:
require "power_client/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name          = "power_client"
  s.version       = PowerClient::VERSION
  s.authors       = ["Platanus"]
  s.email         = ["rubygems@platan.us"]
  s.homepage      = "https://github.com/platanus/power_client"
  s.summary       = ""
  s.description   = ""
  s.license       = "MIT"

  s.files = `git ls-files`.split($/).reject { |fn| fn.start_with? "spec" }
  s.bindir = "exe"
  s.executables = s.files.grep(%r{^exe/}) { |f| File.basename(f) }
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "active_job_log"
  s.add_dependency "power-types"
  s.add_dependency "rails", ">= 4.2.0"
  s.add_dependency "active_job_log"
  s.add_dependency "power-types"
  s.add_development_dependency "pry"
  s.add_development_dependency "pry-rails"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "factory_bot_rails"
  s.add_development_dependency "coveralls"
end
