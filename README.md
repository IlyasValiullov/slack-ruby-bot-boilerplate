Slack-Ruby-Bot-Boilerplate
==============

A generic Slack bot framework written in Ruby on top of [slack-ruby-client](https://github.com/slack-ruby/slack-ruby-client). 
It is slack-ruby-bot but without server, only commands parsing part.


![](slack.png)

## Useful to Me?
* 

## Usage

### A Minimal Bot

#### Gemfile

```ruby
source 'https://rubygems.org'

gem 'slack-ruby-bot-boilerplate'
```

#### pongbot.rb

```ruby
require 'slack_respondent'
require 'pong_command'

class PongBot 
  include SlackRespondent::Reactions
  
  def initialize(
    on("app_mention", PongCommand)
  end

  def call(request)
    react(request["event"]["type"], request["event"])
  end

end
```
#### pong_command.rb
```ruby
class PongCommand
  help do
    title 'candidate import'
    desc 'Import new candidate to HR app'
  end

  def self.call(client, data, _match)
    client.say(channel: data.channel, text: "Pong")
  end
end
```

After [registering the bot](DEPLOYMENT.md), run with `SLACK_API_TOKEN=... bundle exec ruby pongbot.rb`. Have the bot join a channel and send it a ping.

![](screenshots/demo.gif)

### A Production Bot


### More Involved Examples


### Commands and Operators

