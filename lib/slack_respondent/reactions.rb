module SlackRespondent
  module Reactions
    def self.included(base)
      base.cattr_accessor :reactions
    end

    def on(event_name, command)
      self.reactions ||= {}

      self.reactions[event_name] ||= []
      self.reactions[event_name].insert(0, command)
    end

    def react(event_type, data)

      result = false
      reactions[event_type].each do |reaction|
        if reaction.invoke(client, data.event)
          result = true
          break
        end
      end

      result
    end

    def config
      SlackRespondent.config
    end

    private

    def client
      @client ||= SlackRespondent::ClientWrapper.new
    end

  end
end
