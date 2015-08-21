# -*- encoding: utf-8 -*-
# stub: krausefx-shenzhen 0.14.5 ruby lib

Gem::Specification.new do |s|
  s.name = "krausefx-shenzhen"
  s.version = "0.14.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Mattt Thompson"]
  s.date = "2015-07-23"
  s.description = "CLI for Building & Distributing iOS Apps (.ipa Files)"
  s.email = "m@mattt.me"
  s.executables = ["krausefx-ipa"]
  s.files = ["bin/krausefx-ipa"]
  s.homepage = "http://nomad-cli.com"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.8"
  s.summary = "Shenzhen"

  s.installed_by_version = "2.4.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<commander>, ["~> 4.3"])
      s.add_runtime_dependency(%q<highline>, [">= 1.7.2"])
      s.add_runtime_dependency(%q<terminal-table>, ["~> 1.4.5"])
      s.add_runtime_dependency(%q<json>, ["~> 1.8"])
      s.add_runtime_dependency(%q<faraday>, ["~> 0.9"])
      s.add_runtime_dependency(%q<faraday_middleware>, ["~> 0.9"])
      s.add_runtime_dependency(%q<dotenv>, [">= 0.7"])
      s.add_runtime_dependency(%q<aws-sdk>, ["~> 1.0"])
      s.add_runtime_dependency(%q<net-sftp>, ["~> 2.1.2"])
      s.add_runtime_dependency(%q<plist>, ["~> 3.1.0"])
      s.add_runtime_dependency(%q<rubyzip>, ["~> 1.1"])
      s.add_runtime_dependency(%q<security>, ["~> 0.1.3"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
    else
      s.add_dependency(%q<commander>, ["~> 4.3"])
      s.add_dependency(%q<highline>, [">= 1.7.2"])
      s.add_dependency(%q<terminal-table>, ["~> 1.4.5"])
      s.add_dependency(%q<json>, ["~> 1.8"])
      s.add_dependency(%q<faraday>, ["~> 0.9"])
      s.add_dependency(%q<faraday_middleware>, ["~> 0.9"])
      s.add_dependency(%q<dotenv>, [">= 0.7"])
      s.add_dependency(%q<aws-sdk>, ["~> 1.0"])
      s.add_dependency(%q<net-sftp>, ["~> 2.1.2"])
      s.add_dependency(%q<plist>, ["~> 3.1.0"])
      s.add_dependency(%q<rubyzip>, ["~> 1.1"])
      s.add_dependency(%q<security>, ["~> 0.1.3"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
    end
  else
    s.add_dependency(%q<commander>, ["~> 4.3"])
    s.add_dependency(%q<highline>, [">= 1.7.2"])
    s.add_dependency(%q<terminal-table>, ["~> 1.4.5"])
    s.add_dependency(%q<json>, ["~> 1.8"])
    s.add_dependency(%q<faraday>, ["~> 0.9"])
    s.add_dependency(%q<faraday_middleware>, ["~> 0.9"])
    s.add_dependency(%q<dotenv>, [">= 0.7"])
    s.add_dependency(%q<aws-sdk>, ["~> 1.0"])
    s.add_dependency(%q<net-sftp>, ["~> 2.1.2"])
    s.add_dependency(%q<plist>, ["~> 3.1.0"])
    s.add_dependency(%q<rubyzip>, ["~> 1.1"])
    s.add_dependency(%q<security>, ["~> 0.1.3"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
  end
end
