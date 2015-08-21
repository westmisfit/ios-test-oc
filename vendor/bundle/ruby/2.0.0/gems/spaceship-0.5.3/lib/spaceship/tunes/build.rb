module Spaceship
  module Tunes
    # Represents a build which is inside the build train
    class Build < TunesBase

      #####################################################
      # @!group General metadata
      #####################################################

      # @return (Spaceship::Tunes::BuildTrain) A reference to the build train this build is contained in
      attr_accessor :build_train

      # @return (Integer) The ID generated by iTunes Connect
      attr_accessor :id

      # @return (Boolean)
      attr_accessor :valid

      # @return (String) The build version (not the version number), but also is named `build number`
      attr_accessor :build_version

      # @return (String) The version number (e.g. 1.3)
      attr_accessor :train_version

      # @return (Integer) The number of ticks since 1970 (e.g. 1413966436000)
      attr_accessor :upload_date

      # @return (String) URL to the app icon of this build (150x150px)
      attr_accessor :icon_url

      # @return (String) The name of the app this build is for
      attr_accessor :app_name

      # @return (String) The platform of this build (e.g. 'ios')
      attr_accessor :platform

      # @return (Integer) When is this build going to be invalid
      attr_accessor :internal_expiry_date

      # @return (Integer): When is the external build going to expire?
      attr_accessor :external_expiry_date

      # @return (Boolean): Is this build available for external beta testing
      #   this is only true after the build was approved by Apple
      attr_accessor :external_testing_enabled

      # @return (Bool) Does this build support WatchKit?
      attr_accessor :watch_kit_enabled

      # @return (Bool):
      attr_accessor :ready_to_install

      #####################################################
      # @!group Analytics
      #####################################################

      # @return (Integer) Number of installs of this build
      attr_accessor :install_count

      # @return (Integer) Number of installs for this build that come from internal users
      attr_accessor :internal_install_count

      # @return (Integer) Number of installs for this build that come from external users
      attr_accessor :external_install_count

      # @return (Integer) Might be nil. The number of sessions for this build
      attr_accessor :session_count

      # @return (Integer) Might be nil. The number of crashes of this build
      attr_accessor :crash_count

      attr_mapping(
        'uploadDate' => :upload_date,
        'iconUrl' => :icon_url,
        'buildVersion' => :build_version,
        'trainVersion' => :train_version,
        'appName' => :app_name,
        'platform' => :platform,
        'id' => :id,
        'valid' => :valid,

        'installCount' => :install_count,
        'internalInstallCount' => :internal_install_count,
        'externalInstallCount' => :external_install_count,
        'sessionCount' => :session_count,
        'crashCount' => :crash_count,
        'internalExpiry' => :internal_expiry_date,
        'externalExpiry' => :external_expiry_date,
        'watchKitEnabled' => :watch_kit_enabled,
        'readyToInstall' => :ready_to_install
      )

      class << self
        # Create a new object based on a hash.
        # This is used to create a new object based on the server response.
        def factory(attrs)
          self.new(attrs)
        end
      end

      def setup
        super

        self.external_expiry_date ||= 0
        @external_testing_enabled = self.external_expiry_date > 0
      end

      # This will submit this build for TestFlight beta review
      # @param metadata [Hash] A hash containing the following information (keys must be symbols):
      #  {
      #    # Required Metadata:
      #     changelog: "Changelog",
      #     description: "Your Description",
      #     feedback_email: "Email Address for Feedback",
      #     marketing_url: "https://marketing.com",
      #     first_name: "Felix",
      #     last_name: "Krause",
      #     review_email: "Contact email address for Apple",
      #     phone_number: "0128383383",
      #
      #   # Optional Metadata:
      #     privacy_policy_url: nil,
      #     review_notes: nil,
      #     review_user_name: nil,
      #     review_password: nil,
      #     encryption: false
      #  }
      def submit_for_beta_review!(metadata)
        # First, enable beta testing for this train (per iTC requirement)
        self.build_train.update_testing_status!(true)

        parameters = {
          app_id: self.build_train.application.apple_id,
          train: self.build_train.version_string,
          build_number: self.build_version,

          # Required Metadata:
          changelog: "No changelog provided",
          description: "No app description provided",
          feedback_email: "contact@company.com",
          marketing_url: "http://marketing.com",
          first_name: "Felix",
          last_name: "Krause",
          review_email: "contact@company.com",
          phone_number: "0123456789",

          # Optional Metadata:
          privacy_policy_url: nil,
          review_user_name: nil,
          review_password: nil,
          encryption: false
        }.merge(metadata)

        client.submit_testflight_build_for_review!(parameters)

        return parameters
      end

      # @return [String] A nicely formatted string about the state of this build
      # @examples:
      #   External, Internal, Inactive, Expired
      def testing_status
        testing ||= "External" if self.external_expiry_date > 0

        if self.build_train.testing_enabled
          # only the latest build is actually valid
          if self.build_train.builds.find_all { |b| b.upload_date > self.upload_date }.count == 0
            testing ||= "Internal"
          end
        end

        if Time.at(self.internal_expiry_date / 1000) > Time.now
          testing ||= "Inactive"
        else
          testing = "Expired"
        end

        return testing
      end

      # This will cancel the review process for this TestFlight build
      def cancel_beta_review!
        client.remove_testflight_build_from_review!(app_id: self.build_train.application.apple_id,
                                                     train: self.build_train.version_string,
                                              build_number: self.build_version)
      end
    end
  end
end

# Example response
#   "buildVersion": "0.9.10",
#   "trainVersion": "0.9.10",
#   "uploadDate": 1413966436000,
#   "iconUrl": "https://is5-ssl.mzstatic.com/image/thumb/Newsstand5/v4/e8/ab/f8/e8abf8ca-6c22-a519-aa1b-c73901c4917e/Icon-60@2x.png.png/150x150bb-80.png",
#   "appName": "Yeahaa",
#   "platform": "ios",
#   "betaEntitled": false,
#   "id": 523299,
#   "valid": true,
#   "missingExportCompliance": false,
#   "waitingForExportComplianceApproval": false,
#   "addedInternalUsersCount": 0,
#   "addedExternalUsersCount": 0,
#   "invitedExternalUsersCount": 0,
#   "invitedInternalUsersCount": 0,
#   "acceptedInternalUsersCount": 0,
#   "acceptedExternalUsersCount": 0,
#   "installCount": 0,
#   "internalInstallCount": 0,
#   "externalInstallCount": 0,
#   "sessionCount": null,
#   "crashCount": null,
#   "promotedVersion": null,
#   "internalState": "noBetaEntitlement",
#   "betaState": "noBetaEntitlement",
#   "internalExpiry": 1416562036000,
#   "externalExpiry": 0,
#   "watchKitEnabled": false,
#   "readyToInstall": false,
#   "sdkBuildWhitelisted": true,
#   "internalTesting": null,
#   "externalTesting": null
