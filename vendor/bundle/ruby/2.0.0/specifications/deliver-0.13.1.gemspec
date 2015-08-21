# -*- encoding: utf-8 -*-
# stub: deliver 0.13.1 ruby lib

Gem::Specification.new do |s|
  s.name = "deliver"
  s.version = "0.13.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Felix Krause"]
  s.date = "2015-08-11"
  s.description = "Upload screenshots, metadata and your app to the App Store using a single command"
  s.email = ["deliver@krausefx.com"]
  s.executables = ["deliver"]
  s.files = ["bin/deliver"]
  s.homepage = "https://fastlane.tools"
  s.licenses = ["MIT"]
  s.required_ruby_version = Gem::Requirement.new(">= 2.0.0")
  s.rubygems_version = "2.4.8"
  s.summary = "Upload screenshots, metadata and your app to the App Store using a single command"

  s.installed_by_version = "2.4.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<fastlane_core>, [">= 0.7.2"])
      s.add_runtime_dependency(%q<credentials_manager>, [">= 0.3.0"])
      s.add_runtime_dependency(%q<nokogiri>, ["~> 1.6.5"])
      s.add_runtime_dependency(%q<fastimage>, ["~> 1.6.3"])
      s.add_runtime_dependency(%q<rubyzip>, ["~> 1.1.6"])
      s.add_runtime_dependency(%q<plist>, ["~> 3.1.0"])
      s.add_runtime_dependency(%q<excon>, [">= 0"])
      s.add_development_dependency(%q<bundler>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 3.1.0"])
      s.add_development_dependency(%q<pry>, [">= 0"])
      s.add_development_dependency(%q<yard>, ["~> 0.8.7.4"])
      s.add_development_dependency(%q<webmock>, ["~> 1.19.0"])
      s.add_development_dependency(%q<coveralls>, [">= 0"])
    else
      s.add_dependency(%q<fastlane_core>, [">= 0.7.2"])
      s.add_dependency(%q<credentials_manager>, [">= 0.3.0"])
      s.add_dependency(%q<nokogiri>, ["~> 1.6.5"])
      s.add_dependency(%q<fastimage>, ["~> 1.6.3"])
      s.add_dependency(%q<rubyzip>, ["~> 1.1.6"])
      s.add_dependency(%q<plist>, ["~> 3.1.0"])
      s.add_dependency(%q<excon>, [">= 0"])
      s.add_dependency(%q<bundler>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 3.1.0"])
      s.add_dependency(%q<pry>, [">= 0"])
      s.add_dependency(%q<yard>, ["~> 0.8.7.4"])
      s.add_dependency(%q<webmock>, ["~> 1.19.0"])
      s.add_dependency(%q<coveralls>, [">= 0"])
    end
  else
    s.add_dependency(%q<fastlane_core>, [">= 0.7.2"])
    s.add_dependency(%q<credentials_manager>, [">= 0.3.0"])
    s.add_dependency(%q<nokogiri>, ["~> 1.6.5"])
    s.add_dependency(%q<fastimage>, ["~> 1.6.3"])
    s.add_dependency(%q<rubyzip>, ["~> 1.1.6"])
    s.add_dependency(%q<plist>, ["~> 3.1.0"])
    s.add_dependency(%q<excon>, [">= 0"])
    s.add_dependency(%q<bundler>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 3.1.0"])
    s.add_dependency(%q<pry>, [">= 0"])
    s.add_dependency(%q<yard>, ["~> 0.8.7.4"])
    s.add_dependency(%q<webmock>, ["~> 1.19.0"])
    s.add_dependency(%q<coveralls>, [">= 0"])
  end
end
