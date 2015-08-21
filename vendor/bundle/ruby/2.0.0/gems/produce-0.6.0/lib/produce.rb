require 'json'
require 'produce/version'
require 'produce/manager'
require 'produce/dependency_checker'
require 'produce/developer_center'
require 'produce/itunes_connect'
require 'produce/available_default_languages'

require 'fastlane_core'

module Produce
  class << self
    attr_accessor :config
  end

  Helper = FastlaneCore::Helper # you gotta love Ruby: Helper.* should use the Helper class contained in FastlaneCore

  ENV['FASTLANE_TEAM_ID'] ||= ENV["PRODUCE_TEAM_ID"]
  ENV['DELIVER_USER'] ||= ENV["PRODUCE_USERNAME"]

  DependencyChecker.check_dependencies
end
