module Fastlane
  module Actions
    module SharedValues
      XCODEBUILD_ARCHIVE = :XCODEBUILD_ARCHIVE
    end

    # xcodebuild man page:
    # https://developer.apple.com/library/mac/documentation/Darwin/Reference/ManPages/man1/xcodebuild.1.html

    class XcodebuildAction < Action
      ARGS_MAP = {
        # actions
        analyze: "analyze",
        archive: "archive",
        build: "build",
        clean: "clean",
        install: "install",
        installsrc: "installsrc",
        test: "test",

        # parameters
        alltargets: "-alltargets",
        arch: "-arch",
        archive_path: "-archivePath",
        configuration: "-configuration",
        derivedDataPath: "-derivedDataPath",
        destination_timeout: "-destination-timeout",
        export_archive: "-exportArchive",
        export_format: "-exportFormat",
        export_installer_identity: "-exportInstallerIdentity",
        export_path: "-exportPath",
        export_profile: "-exportProvisioningProfile",
        export_signing_identity: "-exportSigningIdentity",
        export_with_original_signing_identity: "-exportWithOriginalSigningIdentity",
        project: "-project",
        result_bundle_path: "-resultBundlePath",
        scheme: "-scheme",
        sdk: "-sdk",
        skip_unavailable_actions: "-skipUnavailableActions",
        target: "-target",
        workspace: "-workspace",
        xcconfig: "-xcconfig"
      }

      def self.is_supported?(platform)
        [:ios, :mac].include?platform
      end

      def self.run(params)
        unless Helper.test?
          raise "xcodebuild not installed".red if `which xcodebuild`.length == 0
        end

        # The args we will build with
        xcodebuild_args = Array[]

        # Supported ENV vars
        build_path = ENV["XCODE_BUILD_PATH"] || nil
        scheme     = ENV["XCODE_SCHEME"]
        workspace  = ENV["XCODE_WORKSPACE"]
        project    = ENV["XCODE_PROJECT"]

        # Append slash to build path, if needed
        if build_path && !build_path.end_with?("/")
          build_path += "/"
        end


        if params
          # Operation bools
          archiving = params.key? :archive
          exporting = params.key? :export_archive
          testing   = params.key? :test

          if exporting
            # If not passed, retrieve path from previous xcodebuild call
            params[:archive_path] ||= Actions.lane_context[SharedValues::XCODEBUILD_ARCHIVE]

            # Default to ipa as export format
            params[:export_format] ||= "ipa"

            # If not passed, construct export path from env vars
            if params[:export_path] == nil
              ipa_filename = scheme ? scheme : File.basename(params[:archive_path], ".*")
              params[:export_path] = "#{build_path}#{ipa_filename}"
            end

            # Store IPA path for later deploy steps (i.e. Crashlytics)
            Actions.lane_context[SharedValues::IPA_OUTPUT_PATH] = params[:export_path] + "." + params[:export_format].downcase
          else
            # If not passed, check for archive scheme & workspace/project env vars
            params[:scheme] ||= scheme
            params[:workspace] ||= workspace
            params[:project] ||= project

            # If no project or workspace was passed in or set as an environment
            # variable, attempt to autodetect the workspace.
            if params[:project].to_s.empty? && params[:workspace].to_s.empty?
              params[:workspace] = detect_workspace
            end
          end

          if archiving
            # If not passed, construct archive path from env vars
            params[:archive_path] ||= "#{build_path}#{params[:scheme]}.xcarchive"

            # Cache path for later xcodebuild calls
            Actions.lane_context[SharedValues::XCODEBUILD_ARCHIVE] = params[:archive_path]
          end

          # Maps parameter hash to CLI args
          if hash_args = hash_to_args(params)
            xcodebuild_args += hash_args
          end
        end

        # Joins args into space delimited string
        xcodebuild_args = xcodebuild_args.join(" ")

        # Default args
        xcpretty_args = []

        # Formatting style
        if params && params[:output_style]
          output_style = params[:output_style]
          raise "Invalid output_style #{output_style}".red unless [:standard, :basic].include?(output_style)
        else
          output_style = :standard
        end

        case output_style
        when :standard
          xcpretty_args << '--color'
        when :basic
          xcpretty_args << '--no-utf'
        end

        if testing
          if params[:reports]
            # New report options format
            reports = params[:reports].reduce("") do |arguments, report|

              report_string = "--report #{report[:report]}"

              if report[:output]
                report_string << " --output \"#{report[:output]}\""
              elsif report[:report] == 'junit'
                report_string << " --output \"#{build_path}report/report.xml\""
              elsif report[:report] == 'html'
                report_string << " --output \"#{build_path}report/report.html\""
              elsif report[:report] == 'json-compilation-database'
                report_string << " --output \"#{build_path}report/report.json\""
              end

              if report[:screenshots]
                report_string << " --screenshots"
              end

              unless arguments == ""
                arguments << " "
              end

              arguments << report_string
            end

            xcpretty_args.push reports

          elsif params[:report_formats]
            # Test report file format
            report_formats = params[:report_formats].map do |format|
              "--report #{format}"
            end.sort().join(" ")

            xcpretty_args.push report_formats

            # Save screenshots flag
            if params[:report_formats].include?("html") && params[:report_screenshots]
              xcpretty_args.push "--screenshots"
            end

            xcpretty_args.sort!

            # Test report file path
            if params[:report_path]
              xcpretty_args.push "--output \"#{params[:report_path]}\""
            elsif build_path
              xcpretty_args.push "--output \"#{build_path}report\""
            end
          end
        end

        # Stdout format
        if testing && !archiving
          xcpretty_args.push "--test"
        else
          xcpretty_args.push "--simple"
        end

        xcpretty_args = xcpretty_args.join(" ")

        # In some cases the simulator is not booting up in time
        # One way to solve it is to try to rerun it for one more time
        begin
          Actions.sh "set -o pipefail && xcodebuild #{xcodebuild_args} | xcpretty #{xcpretty_args}"
        rescue => ex
          exit_status = $?.exitstatus

          raise_error = true
          if exit_status.eql? 65
            iphone_simulator_time_out_error = /iPhoneSimulator: Timed out waiting/

            if (iphone_simulator_time_out_error =~ ex.message) != nil
              raise_error = false

              Helper.log.warn "First attempt failed with iPhone Simulator error: #{iphone_simulator_time_out_error.source}"
              Helper.log.warn  "Retrying once more..."
              Actions.sh "set -o pipefail && xcodebuild #{xcodebuild_args} | xcpretty #{xcpretty_args}"
            end
          end

          raise ex if raise_error
        end
      end

      def self.hash_to_args(hash)
        # Remove nil value params
        hash = hash.delete_if { |_, v| v.nil? }

        # Maps nice developer param names to CLI arguments
        hash.map do |k, v|
          v ||= ""
          if arg = ARGS_MAP[k]
            value = (v != true && v.to_s.length > 0 ? "\"#{v}\"" : "")
            "#{arg} #{value}".strip
          elsif k == :build_settings
            v.map{|setting,value| "#{setting}=\"#{value}\""}.join(' ')
          elsif k == :destination
            [*v].collect { |dst| "-destination \"#{dst}\"" }.join(' ')
          elsif k == :keychain && v.to_s.length > 0
            # If keychain is specified, append as OTHER_CODE_SIGN_FLAGS
            "OTHER_CODE_SIGN_FLAGS=\"--keychain #{v}\""
          end
        end.compact.sort
      end

      def self.detect_workspace
        workspace = nil
        workspaces = Dir.glob("*.xcworkspace")

        if workspaces.length > 1
          Helper.log.warn "Multiple workspaces detected."
        end

        if !workspaces.empty?
          workspace = workspaces.first
          Helper.log.warn "Using workspace \"#{workspace}\""
        end

        return workspace
      end

      def self.description
        "Use the `xcodebuild` command to build and sign your app"
      end

      def self.available_options
        [
          ['archive', 'Set to true to build archive'],
          ['archive_path', 'The path to archive the to. Must contain `.xcarchive`'],
          ['workspace', 'The workspace to use'],
          ['scheme', 'The scheme to build'],
          ['build_settings', 'Hash of additional build information'],
          ['output_style', 'Set the output format to one of: :standard (Colored UTF8 output, default), :basic (black & white ASCII outout)']
        ]
      end

      def self.details
        "More infomration on GitHub: https://github.com/KrauseFx/fastlane/blob/master/docs/Actions.md#xcodebuild"
      end

      def self.author
        "dtrenz"
      end
    end

    class XcarchiveAction < Action
      def self.run(params)
        params_hash = params || {}
        params_hash[:archive] = true
        XcodebuildAction.run(params_hash)
      end

      def self.description
        "Builds the project using `xcodebuild`"
      end

      def self.author
        "dtrenz"
      end

      def self.is_supported?(platform)
        [:ios, :mac].include?platform
      end

      def self.available_options
        [
          ['archive_path', 'The path to archive the to. Must contain `.xcarchive`'],
          ['workspace', 'The workspace to use'],
          ['scheme', 'The scheme to build'],
          ['build_settings', 'Hash of additional build information'],
          ['output_style', 'Set the output format to one of: :standard (Colored UTF8 output, default), :basic (black & white ASCII outout)']
        ]
      end
    end

    class XcbuildAction < Action
      def self.run(params)
        params_hash = params || {}
        params_hash[:build] = true
        XcodebuildAction.run(params_hash)
      end

      def self.description
        "Builds the project using `xcodebuild`"
      end

      def self.author
        "dtrenz"
      end

      def self.is_supported?(platform)
        [:ios, :mac].include?platform
      end

      def self.available_options
        [
          ['archive', 'Set to true to build archive'],
          ['archive_path', 'The path to archive the to. Must contain `.xcarchive`'],
          ['workspace', 'The workspace to use'],
          ['scheme', 'The scheme to build'],
          ['build_settings', 'Hash of additional build information'],
          ['output_style', 'Set the output format to one of: :standard (Colored UTF8 output, default), :basic (black & white ASCII outout)']
        ]
      end
    end

    class XccleanAction < Action
      def self.run(params)
        params_hash = params || {}
        params_hash[:clean] = true
        XcodebuildAction.run(params_hash)
      end

      def self.description
        "Builds the project using `xcodebuild`"
      end

      def self.author
        "dtrenz"
      end

      def self.is_supported?(platform)
        [:ios, :mac].include?platform
      end

      def self.available_options
        [
          ['archive', 'Set to true to build archive'],
          ['archive_path', 'The path to archive the to. Must contain `.xcarchive`'],
          ['workspace', 'The workspace to use'],
          ['scheme', 'The scheme to build'],
          ['build_settings', 'Hash of additional build information'],
          ['output_style', 'Set the output format to one of: :standard (Colored UTF8 output, default), :basic (black & white ASCII outout)']
        ]
      end
    end

    class XcexportAction < Action
      def self.run(params)
        params_hash = params || {}
        params_hash[:export_archive] = true
        XcodebuildAction.run(params_hash)
      end

      def self.description
        "Builds the project using `xcodebuild`"
      end

      def self.author
        "dtrenz"
      end

      def self.available_options
        [
          ['archive', 'Set to true to build archive'],
          ['archive_path', 'The path to archive the to. Must contain `.xcarchive`'],
          ['workspace', 'The workspace to use'],
          ['scheme', 'The scheme to build'],
          ['build_settings', 'Hash of additional build information'],
          ['output_style', 'Set the output format to one of: :standard (Colored UTF8 output, default), :basic (black & white ASCII outout)']
        ]
      end

      def self.is_supported?(platform)
        [:ios, :mac].include?platform
      end
    end

    class XctestAction < Action
      def self.run(params)
        params_hash = params || {}
        params_hash[:test] = true
        XcodebuildAction.run(params_hash)
      end

      def self.description
        "Runs tests on the given simulator"
      end

      def self.available_options
        [
          ['archive', 'Set to true to build archive'],
          ['archive_path', 'The path to archive the to. Must contain `.xcarchive`'],
          ['workspace', 'The workspace to use'],
          ['scheme', 'The scheme to build'],
          ['build_settings', 'Hash of additional build information'],
          ['destination', 'The simulator to use, e.g. "name=iPhone 5s,OS=8.1"'],
          ['destination_timeout', 'The timeout for connecting to the simulator, in seconds'],
          ['output_style', 'Set the output format to one of: :standard (Colored UTF8 output, default), :basic (black & white ASCII outout)']
        ]
      end

      def self.is_supported?(platform)
        [:ios, :mac].include?platform
      end

      def self.author
        "dtrenz"
      end
    end
  end
end
