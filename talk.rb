require 'http'
require 'uri'
require 'json'
require 'faraday'
require 'slack-ruby-client'
talkapi_tk = '#'
slack_tk = '#'

def talk_a3rt(api, text)
  uri = URI.parse('https://api.a3rt.recruit-tech.co.jp/talk/v1/smalltalk')
  params = {apikey: api,query: text }

  res = Faraday.post uri, params
  json = JSON.parse(res.body)
  response =json["results"][0]["reply"]
  return response.to_s
end



Slack.configure do |config|
  config.token = slack_tk
end

client = Slack::RealTime::Client.new

client.on :hello do
  puts 'connected'
  client.message channel: '#general', text: 'connected'
end

client.on :message do |data|
  if data['text']
    tex = data['text']
    client.message channel: data['channel'], text: talk_a3rt(talkapi_tk, tex)
  end
end

client.start!



