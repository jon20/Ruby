require 'open-uri'
require 'http'
require 'json'
url="http://weather.livedoor.com/forecast/webservice/json/v1?city=400010"

token_key = ""

ws= JSON.parse(open(url).read)

def post(tk, ch, tex, user)
     HTTP.post("https://slack.com/api/chat.postMessage", params:{
    token: tk,
    channel: ch,
    text: tex,
    as_user: user
    })
end
res = post(token_key, "general", ws.dig("description", "text"), true)
puts JSON.pretty_generate(JSON.parse(res.body))
