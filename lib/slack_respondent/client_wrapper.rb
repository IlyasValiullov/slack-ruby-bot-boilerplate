module SlackRespondent
  class ClientWrapper
    include Loggable

    attr_accessor :aliases
    attr_accessor :names
    attr_reader :client

    def initialize
      @name = []

      response = client.auth_test

      SlackRespondent.configure do |config|
        config.url = response.url
        config.team = response.team
        config.team_id = response.team_id
        config.user = response.user
        config.user_id = response.user_id
        logger.info "Welcome #{response.user} to the #{response.team} team."
      end
    end

    def names
      [
        SlackRespondent::Config.user,
        SlackRespondent::Config.aliases ? SlackRespondent::Config.aliases.map(&:downcase) : nil,
        SlackRespondent::Config.user_id ? "<@#{SlackRespondent::Config.user_id.downcase}>" : nil,
        SlackRespondent::Config.user_id ? "<@#{SlackRespondent::Config.user_id.downcase}>:" : nil,
        SlackRespondent::Config.user ? "#{SlackRespondent::Config.user}:" : nil
      ].compact.flatten
    end

    def name?(name)
      name && names.include?(name.downcase)
    end

    def user_id
      names.first
    end

    def name
      SlackRespondent.config.user || (self.self && self.self.name)
    end

    def url
      SlackRespondent.config.url
    end

    def say(options = {})
      filtered_options = options.slice(:channel, :text, :attachments)
      client.chat_postMessage(filtered_options)
    end

    private

    def client
      @client ||= ClientProvider.client.new
    end
  end
end
