trap("SIGINT") { exit! }

require 'comboclient'

puts "This is The Clock"

time = 0

timetopic = ComboClient.new('178.62.106.39', 'time')
displaytopic = ComboClient.new('178.62.106.39', 'display.rendered')

timetopic.add(time: time)

displaytopic.subscribe do |newdata, manager|
  time += 1
  puts "TICK! The time is now #{time}"
  timetopic.add(time: time)
end
