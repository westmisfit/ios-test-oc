module Fastlane
  module Actions
    module SharedValues
    end

    class TeamIdAction < Action
      def self.run(params)
        team = (params.first rescue nil)
        raise "Please pass your Team ID (e.g. team_id 'Q2CBPK58CA')".red unless team.to_s.length > 0

        Helper.log.info "Setting Team ID to '#{team}' for all build steps"

        [:CERT_TEAM_ID, :SIGH_TEAM_ID, :PEM_TEAM_ID, :PRODUCE_TEAM_ID, :SIGH_TEAM_ID, :FASTLANE_TEAM_ID].each do |current|
          ENV[current.to_s] = team
        end
      end

      def self.author
        "KrauseFx"
      end

      def self.description
        "Specify the Team ID you want to use for the Apple Developer Portal"
      end

      def self.is_supported?(platform)
        platform == :ios
      end
    end
  end
end
