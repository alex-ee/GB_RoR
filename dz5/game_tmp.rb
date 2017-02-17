require_relative 'lib/semafore.rb'
require_relative 'lib/transport.rb'
require_relative 'lib/road.rb'
require_relative 'lib/crossroad.rb'

module GameTmp
  def self.create road_count:, roads_length:
    roads = []
    puts "Now we need to place semafore on each road."
    (1..road_count).each do |road|
      print "Where do you want place semafore on road \##{road}? Enter here: #{roads_length / 2}"
      semafore_place = gets.to_i | roads_length / 2

      roads.push Road.new semafore: (Semafore.new place_point: semafore_place), length: roads_length

    end

    CrossRoad.new roads

  end
end

puts "Hello! :)\n\n"
print "How many roads need to create? Enter here (2): "
road_count = gets.to_i | 2

print "What will be the length of the roads? Enter here (10): "
roads_length = gets.to_i | 10

game = GameTmp.create road_count: road_count, roads_length: roads_length

puts "All is ok! #{road_count} roads with semafores was created!"
puts "Now we need to create cars or bikes or other on each road."

game.roads.each_with_index do |e, ind|
  puts "Current road \##{ind+1}"
  print "Is will be a ...? (car): "
  vid = gets.to_s | 'car'

  print "Start point wil be ...? (1): "
  start_point = gets.to_i | 1

  print "Speed will be ...? (1,-1,...): "
  speed = gets.to_i | 1

  transport = GameTmp::Transport.new vid: vid, speed: speed, start_point: start_point

  until e.add_transport(transport)
    puts "In that place can't be added #{vid}, because it busy or outside the road"
  end

end

puts "All cars are placed. Let's start motion!"


#....................
