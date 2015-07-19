require 'rspec/expectations'

RSpec::Matchers.define :respond_with_slack_message do |expected|
  match do |actual|
    channel, user, message = parse(actual)
    allow(Giphy).to receive(:random)
    expect(SlackRubyBot::Commands::Base).to receive(:chat_postMessage).with(channel: channel, text: expected, as_user: true)
    app.send(:message, text: message, channel: channel, user: user)
    true
  end

  private

  def parse(actual)
    actual = { message: actual } unless actual.is_a?(Hash)
    [actual[:channel] || 'channel', actual[:user] || 'user', actual[:message]]
  end
end