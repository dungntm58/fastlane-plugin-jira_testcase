require 'fastlane_core/configuration/config_item'

module Fastlane
  module JiraTestcase
    class Options
      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :url,
                      env_name: "FL_JIRA_SITE",
                      description: "URL for Jira instance",
                      verify_block: proc do |value|
                        UI.user_error!("No url for Jira given, pass using `url: 'url'`") if value.to_s.length == 0
                      end),
          FastlaneCore::ConfigItem.new(key: :username,
                      env_name: "FL_JIRA_USERNAME",
                      description: "Username for JIRA instance",
                      verify_block: proc do |value|
                        UI.user_error!("No username") if value.to_s.length == 0
                      end),
          FastlaneCore::ConfigItem.new(key: :password,
                      env_name: "FL_JIRA_PASSWORD",
                      description: "Password for Jira",
                      sensitive: true,
                      verify_block: proc do |value|
                        UI.user_error!("No password") if value.to_s.length == 0
                      end),
          FastlaneCore::ConfigItem.new(key: :project_key,
                       env_name: "FL_JIRA_PROJECT_KEY",
                       description: "Project key for Jira",
                       verify_block: proc do |value|
                         UI.user_error!("No Project specified") if value.to_s.length == 0
                       end),
          FastlaneCore::ConfigItem.new(key: :ticket_id,
                      env_name: "FL_JIRA_TICKET_ID",
                      description: "Ticket ID for Jira, i.e. IOS-123",
                      verify_block: proc do |value|
                        UI.user_error!("No Ticket specified") if value.to_s.length == 0
                      end),
          FastlaneCore::ConfigItem.new(key: :comment_text,
                      env_name: "FL_JIRA_COMMENT_TEXT",
                      description: "Text to add to the ticket as a comment",
                      verify_block: proc do |value|
                        UI.user_error!("No comment specified") if value.to_s.length == 0
                      end)
          FastlaneCore::ConfigItem.new(key: :test_folder,
                       env_name: "FL_JIRA_TEST_FOLDER",
                       description: "Folder that contains testrun",
                       verify_block: proc do |value|
                         UI.user_error!("No folder specified") if value.to_s.length == 0
                       end)
        ]
      end
    end
  end
end