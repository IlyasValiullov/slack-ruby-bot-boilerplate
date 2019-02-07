module SlackRespondent
  module Commands
    class About < Base
      command 'about'

      def self.call(client, data, _match)
        client.say(channel: data.channel, text: SlackRespondent::ABOUT)
      end

      def self.pattern
        /^#{bot_matcher}$/u
      end
    end
  end
end
