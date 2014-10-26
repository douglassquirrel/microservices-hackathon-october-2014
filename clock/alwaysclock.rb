trap("SIGINT") { exit! }
require 'comboclient'

puts "This is The Clock"

time = 0

c = ComboClient.new('178.62.106.39', 'time')

while true do
  time += 1
  c.add(time: time)
  puts "Time is now #{time}"
  sleep 3
end
