module SlackRespondent
  class ClientProvider
    def self.client
      @@client_class ||= Slack::Web::Client
    end

    def self.client=(client_class)
      @@client_class = client_class
    end
  end
end