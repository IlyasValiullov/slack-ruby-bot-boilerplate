require 'slack-ruby-client'
require 'active_support'
require 'active_support/core_ext'

require_relative 'slack_respondent/support/loggable'
require_relative 'slack_respondent/commands'
require_relative 'slack_respondent/reactions'
require_relative 'slack_respondent/client'
require_relative 'slack_respondent/config'

module SlackRespondent
  ABOUT = <<-ABOUT
    Bot name
  ABOUT

  class << self
    def configure
      block_given? ? yield(Config) : Config
    end

    def config
      Config
    end
  end
end