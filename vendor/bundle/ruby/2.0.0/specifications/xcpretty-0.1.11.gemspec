# -*- encoding: utf-8 -*-
# stub: xcpretty 0.1.11 ruby lib

Gem::Specification.new do |s|
  s.name = "xcpretty"
  s.version = "0.1.11"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Marin Usalj", "Delisa Mason"]
  s.date = "2015-08-13"
  s.description = "\n  Xcodebuild formatter designed to be piped with `xcodebuild`,\n  and thus keeping 100% compatibility.\n\n  It has modes for CI, running tests (RSpec dot-style),\n  and it can also mine Bitcoins.\n  "
  s.email = ["marin2211@gmail.com", "iskanamagus@gmail.com"]
  s.executables = ["xcpretty"]
  s.files = ["bin/xcpretty"]
  s.homepage = "https://github.com/supermarin/xcpretty"
  s.licenses = ["MIT"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.7")
  s.rubygems_version = "2.4.8"
  s.summary = "xcodebuild formatter done right"

  s.installed_by_version = "2.4.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, ["~> 1.3"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 2"])
      s.add_development_dependency(%q<cucumber>, ["~> 1"])
    else
      s.add_dependency(%q<bundler>, ["~> 1.3"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 2"])
      s.add_dependency(%q<cucumber>, ["~> 1"])
    end
  else
    s.add_dependency(%q<bundler>, ["~> 1.3"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 2"])
    s.add_dependency(%q<cucumber>, ["~> 1"])
  end
end
