# -*- encoding: utf-8 -*-
# stub: credentials_manager 0.7.3 ruby lib

Gem::Specification.new do |s|
  s.name = "credentials_manager"
  s.version = "0.7.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Felix Krause"]
  s.date = "2015-08-13"
  s.description = "Password manager used in fastlane.tools"
  s.email = ["fastlane@krausefx.com"]
  s.homepage = "https://fastlane.tools"
  s.licenses = ["MIT"]
  s.required_ruby_version = Gem::Requirement.new(">= 2.0.0")
  s.rubygems_version = "2.4.8"
  s.summary = "Password manager used in fastlane.tools"

  s.installed_by_version = "2.4.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<highline>, [">= 1.7.1"])
      s.add_runtime_dependency(%q<colored>, [">= 0"])
      s.add_runtime_dependency(%q<security>, [">= 0"])
      s.add_development_dependency(%q<bundler>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<pry>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 3.1.0"])
    else
      s.add_dependency(%q<highline>, [">= 1.7.1"])
      s.add_dependency(%q<colored>, [">= 0"])
      s.add_dependency(%q<security>, [">= 0"])
      s.add_dependency(%q<bundler>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<pry>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 3.1.0"])
    end
  else
    s.add_dependency(%q<highline>, [">= 1.7.1"])
    s.add_dependency(%q<colored>, [">= 0"])
    s.add_dependency(%q<security>, [">= 0"])
    s.add_dependency(%q<bundler>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<pry>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 3.1.0"])
  end
end
