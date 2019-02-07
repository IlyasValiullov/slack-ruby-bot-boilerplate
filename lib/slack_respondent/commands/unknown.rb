module SlackRespondent
  module Commands
    class Unknown < Base
      def self.call(client, data, _match)
        client.say(channel: data.channel, text: "Sorry <@#{data.user}>, I don't understand that command!")
      end

      def self.pattern
        /^(.*)$/
      end
    end
  end
end
