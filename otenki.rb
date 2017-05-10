require "json"
require "open-uri"

URL="http://weather.livedoor.com/forecast/webservice/json/v1?city=400010"

op = JSON.pretty_generate(JSON.parse(open(URL).read))
res = JSON.parse(op)



for fore in res["forecasts"] do
  puts ("---------------------------------------------------------------------------------")
  puts fore["dateLabel"] + "(" + fore["date"] + ")"
  puts fore["telop"]
end
puts ("----------------------------------------------------------------------------")
puts res["title"]
puts ("----------------------------------------------------------------------------")
puts res.dig("description","text")
