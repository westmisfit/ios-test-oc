# -*- encoding: utf-8 -*-
# stub: frameit 2.2.0 ruby lib

Gem::Specification.new do |s|
  s.name = "frameit"
  s.version = "2.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Felix Krause"]
  s.date = "2015-08-18"
  s.description = "Quickly put your screenshots into the right device frames"
  s.email = ["frameit@krausefx.com"]
  s.executables = ["frameit"]
  s.files = ["bin/frameit"]
  s.homepage = "https://fastlane.tools"
  s.licenses = ["MIT"]
  s.required_ruby_version = Gem::Requirement.new(">= 2.0.0")
  s.rubygems_version = "2.4.8"
  s.summary = "Quickly put your screenshots into the right device frames"

  s.installed_by_version = "2.4.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<fastlane_core>, [">= 0.7.2"])
      s.add_runtime_dependency(%q<fastimage>, ["~> 1.6.3"])
      s.add_runtime_dependency(%q<mini_magick>, ["~> 4.0.2"])
      s.add_runtime_dependency(%q<deliver>, ["> 0.3"])
      s.add_development_dependency(%q<bundler>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 3.1.0"])
      s.add_development_dependency(%q<pry>, [">= 0"])
      s.add_development_dependency(%q<yard>, ["~> 0.8.7.4"])
      s.add_development_dependency(%q<coveralls>, [">= 0"])
    else
      s.add_dependency(%q<fastlane_core>, [">= 0.7.2"])
      s.add_dependency(%q<fastimage>, ["~> 1.6.3"])
      s.add_dependency(%q<mini_magick>, ["~> 4.0.2"])
      s.add_dependency(%q<deliver>, ["> 0.3"])
      s.add_dependency(%q<bundler>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 3.1.0"])
      s.add_dependency(%q<pry>, [">= 0"])
      s.add_dependency(%q<yard>, ["~> 0.8.7.4"])
      s.add_dependency(%q<coveralls>, [">= 0"])
    end
  else
    s.add_dependency(%q<fastlane_core>, [">= 0.7.2"])
    s.add_dependency(%q<fastimage>, ["~> 1.6.3"])
    s.add_dependency(%q<mini_magick>, ["~> 4.0.2"])
    s.add_dependency(%q<deliver>, ["> 0.3"])
    s.add_dependency(%q<bundler>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 3.1.0"])
    s.add_dependency(%q<pry>, [">= 0"])
    s.add_dependency(%q<yard>, ["~> 0.8.7.4"])
    s.add_dependency(%q<coveralls>, [">= 0"])
  end
end
