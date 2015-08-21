# -*- encoding: utf-8 -*-
# stub: fastlane_core 0.14.0 ruby lib

Gem::Specification.new do |s|
  s.name = "fastlane_core"
  s.version = "0.14.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Felix Krause"]
  s.date = "2015-08-13"
  s.description = "Contains all shared code/dependencies of the fastlane.tools"
  s.email = ["fastlanecore@krausefx.com"]
  s.homepage = "https://fastlane.tools"
  s.licenses = ["MIT"]
  s.required_ruby_version = Gem::Requirement.new(">= 2.0.0")
  s.rubygems_version = "2.4.8"
  s.summary = "Contains all shared code/dependencies of the fastlane.tools"

  s.installed_by_version = "2.4.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<json>, [">= 0"])
      s.add_runtime_dependency(%q<multi_json>, [">= 0"])
      s.add_runtime_dependency(%q<highline>, [">= 1.7.2"])
      s.add_runtime_dependency(%q<colored>, [">= 0"])
      s.add_runtime_dependency(%q<commander>, [">= 4.3.5"])
      s.add_runtime_dependency(%q<babosa>, [">= 0"])
      s.add_runtime_dependency(%q<excon>, ["~> 0.45.0"])
      s.add_runtime_dependency(%q<rubyzip>, ["~> 1.1.6"])
      s.add_runtime_dependency(%q<credentials_manager>, [">= 0.7.2"])
      s.add_runtime_dependency(%q<phantomjs>, ["~> 1.9.8"])
      s.add_runtime_dependency(%q<capybara>, ["~> 2.4.3"])
      s.add_runtime_dependency(%q<poltergeist>, ["~> 1.5.1"])
      s.add_development_dependency(%q<bundler>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 3.1.0"])
      s.add_development_dependency(%q<pry>, [">= 0"])
      s.add_development_dependency(%q<yard>, ["~> 0.8.7.4"])
      s.add_development_dependency(%q<webmock>, ["~> 1.19.0"])
      s.add_development_dependency(%q<coveralls>, [">= 0"])
    else
      s.add_dependency(%q<json>, [">= 0"])
      s.add_dependency(%q<multi_json>, [">= 0"])
      s.add_dependency(%q<highline>, [">= 1.7.2"])
      s.add_dependency(%q<colored>, [">= 0"])
      s.add_dependency(%q<commander>, [">= 4.3.5"])
      s.add_dependency(%q<babosa>, [">= 0"])
      s.add_dependency(%q<excon>, ["~> 0.45.0"])
      s.add_dependency(%q<rubyzip>, ["~> 1.1.6"])
      s.add_dependency(%q<credentials_manager>, [">= 0.7.2"])
      s.add_dependency(%q<phantomjs>, ["~> 1.9.8"])
      s.add_dependency(%q<capybara>, ["~> 2.4.3"])
      s.add_dependency(%q<poltergeist>, ["~> 1.5.1"])
      s.add_dependency(%q<bundler>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 3.1.0"])
      s.add_dependency(%q<pry>, [">= 0"])
      s.add_dependency(%q<yard>, ["~> 0.8.7.4"])
      s.add_dependency(%q<webmock>, ["~> 1.19.0"])
      s.add_dependency(%q<coveralls>, [">= 0"])
    end
  else
    s.add_dependency(%q<json>, [">= 0"])
    s.add_dependency(%q<multi_json>, [">= 0"])
    s.add_dependency(%q<highline>, [">= 1.7.2"])
    s.add_dependency(%q<colored>, [">= 0"])
    s.add_dependency(%q<commander>, [">= 4.3.5"])
    s.add_dependency(%q<babosa>, [">= 0"])
    s.add_dependency(%q<excon>, ["~> 0.45.0"])
    s.add_dependency(%q<rubyzip>, ["~> 1.1.6"])
    s.add_dependency(%q<credentials_manager>, [">= 0.7.2"])
    s.add_dependency(%q<phantomjs>, ["~> 1.9.8"])
    s.add_dependency(%q<capybara>, ["~> 2.4.3"])
    s.add_dependency(%q<poltergeist>, ["~> 1.5.1"])
    s.add_dependency(%q<bundler>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 3.1.0"])
    s.add_dependency(%q<pry>, [">= 0"])
    s.add_dependency(%q<yard>, ["~> 0.8.7.4"])
    s.add_dependency(%q<webmock>, ["~> 1.19.0"])
    s.add_dependency(%q<coveralls>, [">= 0"])
  end
end