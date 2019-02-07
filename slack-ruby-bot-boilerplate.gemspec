$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'slack_respondent/version'

Gem::Specification.new do |s|
  s.name = 'slack-ruby-bot-boilerplate'
  s.version = SlackRespondent::VERSION
  s.authors = ['Ilyas Valiullov']
  s.email = 'ilyas.valiullov@gmail.com'
  s.platform = Gem::Platform::RUBY
  s.required_rubygems_version = '>= 1.3.6'
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- spec/*`.split("\n")
  s.require_paths = ['lib']
  s.homepage = 'https://github.com/IlyasValiullov/slack-ruby-bot-boilerplate'
  s.licenses = ['MIT']
  s.summary = 'Slack bot boilerplate for response on different events.'
  s.add_dependency 'hashie'
  s.add_dependency 'slack-ruby-client'
  s.add_development_dependency 'rack-test'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rubocop', '0.58.2'
  s.add_development_dependency 'vcr'
  s.add_development_dependency 'webmock'
end
