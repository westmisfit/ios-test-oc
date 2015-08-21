# -*- encoding: utf-8 -*-
# stub: fastlane 1.19.0 ruby lib

Gem::Specification.new do |s|
  s.name = "fastlane"
  s.version = "1.19.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Felix Krause"]
  s.date = "2015-08-20"
  s.description = "Connect all iOS deployment tools into one streamlined workflow"
  s.email = ["fastlane@krausefx.com"]
  s.executables = ["fastlane"]
  s.files = ["bin/fastlane"]
  s.homepage = "https://fastlane.tools"
  s.licenses = ["MIT"]
  s.required_ruby_version = Gem::Requirement.new(">= 2.0.0")
  s.rubygems_version = "2.4.8"
  s.summary = "Connect all iOS deployment tools into one streamlined workflow"

  s.installed_by_version = "2.4.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<nokogiri>, ["~> 1.6"])
      s.add_runtime_dependency(%q<krausefx-shenzhen>, [">= 0.14.5"])
      s.add_runtime_dependency(%q<slack-notifier>, ["~> 1.0"])
      s.add_runtime_dependency(%q<aws-sdk>, ["~> 1.0"])
      s.add_runtime_dependency(%q<xcodeproj>, ["~> 0.20"])
      s.add_runtime_dependency(%q<xcpretty>, ["~> 0.1"])
      s.add_runtime_dependency(%q<terminal-notifier>, ["~> 1.6.2"])
      s.add_runtime_dependency(%q<terminal-table>, ["~> 1.4.5"])
      s.add_runtime_dependency(%q<pbxplorer>, ["~> 1.0.0"])
      s.add_runtime_dependency(%q<rest-client>, ["~> 1.8.0"])
      s.add_runtime_dependency(%q<fastlane_core>, [">= 0.14.0"])
      s.add_runtime_dependency(%q<credentials_manager>, [">= 0.7.3"])
      s.add_runtime_dependency(%q<spaceship>, [">= 0.5.3"])
      s.add_runtime_dependency(%q<deliver>, [">= 0.13.1"])
      s.add_runtime_dependency(%q<snapshot>, [">= 0.9.2"])
      s.add_runtime_dependency(%q<frameit>, [">= 2.2.0"])
      s.add_runtime_dependency(%q<pem>, [">= 0.7.1"])
      s.add_runtime_dependency(%q<cert>, [">= 0.3.0"])
      s.add_runtime_dependency(%q<sigh>, [">= 0.10.4"])
      s.add_runtime_dependency(%q<produce>, [">= 0.6.0"])
      s.add_runtime_dependency(%q<gym>, [">= 0.4.3"])
      s.add_development_dependency(%q<bundler>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 3.1.0"])
      s.add_development_dependency(%q<pry>, [">= 0"])
      s.add_development_dependency(%q<yard>, ["~> 0.8.7.4"])
      s.add_development_dependency(%q<webmock>, ["~> 1.19.0"])
      s.add_development_dependency(%q<coveralls>, [">= 0"])
      s.add_development_dependency(%q<rubocop>, ["~> 0.29"])
    else
      s.add_dependency(%q<nokogiri>, ["~> 1.6"])
      s.add_dependency(%q<krausefx-shenzhen>, [">= 0.14.5"])
      s.add_dependency(%q<slack-notifier>, ["~> 1.0"])
      s.add_dependency(%q<aws-sdk>, ["~> 1.0"])
      s.add_dependency(%q<xcodeproj>, ["~> 0.20"])
      s.add_dependency(%q<xcpretty>, ["~> 0.1"])
      s.add_dependency(%q<terminal-notifier>, ["~> 1.6.2"])
      s.add_dependency(%q<terminal-table>, ["~> 1.4.5"])
      s.add_dependency(%q<pbxplorer>, ["~> 1.0.0"])
      s.add_dependency(%q<rest-client>, ["~> 1.8.0"])
      s.add_dependency(%q<fastlane_core>, [">= 0.14.0"])
      s.add_dependency(%q<credentials_manager>, [">= 0.7.3"])
      s.add_dependency(%q<spaceship>, [">= 0.5.3"])
      s.add_dependency(%q<deliver>, [">= 0.13.1"])
      s.add_dependency(%q<snapshot>, [">= 0.9.2"])
      s.add_dependency(%q<frameit>, [">= 2.2.0"])
      s.add_dependency(%q<pem>, [">= 0.7.1"])
      s.add_dependency(%q<cert>, [">= 0.3.0"])
      s.add_dependency(%q<sigh>, [">= 0.10.4"])
      s.add_dependency(%q<produce>, [">= 0.6.0"])
      s.add_dependency(%q<gym>, [">= 0.4.3"])
      s.add_dependency(%q<bundler>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 3.1.0"])
      s.add_dependency(%q<pry>, [">= 0"])
      s.add_dependency(%q<yard>, ["~> 0.8.7.4"])
      s.add_dependency(%q<webmock>, ["~> 1.19.0"])
      s.add_dependency(%q<coveralls>, [">= 0"])
      s.add_dependency(%q<rubocop>, ["~> 0.29"])
    end
  else
    s.add_dependency(%q<nokogiri>, ["~> 1.6"])
    s.add_dependency(%q<krausefx-shenzhen>, [">= 0.14.5"])
    s.add_dependency(%q<slack-notifier>, ["~> 1.0"])
    s.add_dependency(%q<aws-sdk>, ["~> 1.0"])
    s.add_dependency(%q<xcodeproj>, ["~> 0.20"])
    s.add_dependency(%q<xcpretty>, ["~> 0.1"])
    s.add_dependency(%q<terminal-notifier>, ["~> 1.6.2"])
    s.add_dependency(%q<terminal-table>, ["~> 1.4.5"])
    s.add_dependency(%q<pbxplorer>, ["~> 1.0.0"])
    s.add_dependency(%q<rest-client>, ["~> 1.8.0"])
    s.add_dependency(%q<fastlane_core>, [">= 0.14.0"])
    s.add_dependency(%q<credentials_manager>, [">= 0.7.3"])
    s.add_dependency(%q<spaceship>, [">= 0.5.3"])
    s.add_dependency(%q<deliver>, [">= 0.13.1"])
    s.add_dependency(%q<snapshot>, [">= 0.9.2"])
    s.add_dependency(%q<frameit>, [">= 2.2.0"])
    s.add_dependency(%q<pem>, [">= 0.7.1"])
    s.add_dependency(%q<cert>, [">= 0.3.0"])
    s.add_dependency(%q<sigh>, [">= 0.10.4"])
    s.add_dependency(%q<produce>, [">= 0.6.0"])
    s.add_dependency(%q<gym>, [">= 0.4.3"])
    s.add_dependency(%q<bundler>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 3.1.0"])
    s.add_dependency(%q<pry>, [">= 0"])
    s.add_dependency(%q<yard>, ["~> 0.8.7.4"])
    s.add_dependency(%q<webmock>, ["~> 1.19.0"])
    s.add_dependency(%q<coveralls>, [">= 0"])
    s.add_dependency(%q<rubocop>, ["~> 0.29"])
  end
end
