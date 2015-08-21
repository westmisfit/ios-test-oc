# -*- encoding: utf-8 -*-
# stub: sigh 0.10.4 ruby lib

Gem::Specification.new do |s|
  s.name = "sigh"
  s.version = "0.10.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Felix Krause"]
  s.date = "2015-08-19"
  s.description = "Because you would rather spend your time building stuff than fighting provisioning"
  s.email = ["sigh@krausefx.com"]
  s.executables = ["sigh"]
  s.files = ["bin/sigh"]
  s.homepage = "https://fastlane.tools"
  s.licenses = ["MIT"]
  s.required_ruby_version = Gem::Requirement.new(">= 2.0.0")
  s.rubygems_version = "2.4.8"
  s.summary = "Because you would rather spend your time building stuff than fighting provisioning"

  s.installed_by_version = "2.4.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<fastlane_core>, [">= 0.10.1"])
      s.add_runtime_dependency(%q<plist>, ["~> 3.1.0"])
      s.add_runtime_dependency(%q<spaceship>, [">= 0.0.14"])
      s.add_development_dependency(%q<bundler>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 3.1.0"])
      s.add_development_dependency(%q<pry>, [">= 0"])
      s.add_development_dependency(%q<yard>, ["~> 0.8.7.4"])
      s.add_development_dependency(%q<webmock>, ["~> 1.19.0"])
      s.add_development_dependency(%q<codeclimate-test-reporter>, [">= 0"])
    else
      s.add_dependency(%q<fastlane_core>, [">= 0.10.1"])
      s.add_dependency(%q<plist>, ["~> 3.1.0"])
      s.add_dependency(%q<spaceship>, [">= 0.0.14"])
      s.add_dependency(%q<bundler>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 3.1.0"])
      s.add_dependency(%q<pry>, [">= 0"])
      s.add_dependency(%q<yard>, ["~> 0.8.7.4"])
      s.add_dependency(%q<webmock>, ["~> 1.19.0"])
      s.add_dependency(%q<codeclimate-test-reporter>, [">= 0"])
    end
  else
    s.add_dependency(%q<fastlane_core>, [">= 0.10.1"])
    s.add_dependency(%q<plist>, ["~> 3.1.0"])
    s.add_dependency(%q<spaceship>, [">= 0.0.14"])
    s.add_dependency(%q<bundler>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 3.1.0"])
    s.add_dependency(%q<pry>, [">= 0"])
    s.add_dependency(%q<yard>, ["~> 0.8.7.4"])
    s.add_dependency(%q<webmock>, ["~> 1.19.0"])
    s.add_dependency(%q<codeclimate-test-reporter>, [">= 0"])
  end
end
