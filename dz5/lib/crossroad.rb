module GameTmp
  class CrossRoad
    attr_reader :roads

    def initialize roads:
      @roads = roads
      @crossroads = []
      @roads.each do |e|
        b_find = false
        @crossroads.each do |x|
          if e.semafore.place_point == x[:point]
            x[:roads].push e
            b_find = true

          end

        end
        @crossroads.push ({point: e.semafore.place_point, roads: [e]}) if @crossroads.length == 0 || !b_find

      end

    end

    def all_done?
      res = true
      @roads.each do |e|
        res = false if !e.all_cars_stoped?

      end
      res

    end

    def next_step!
      @roads.each do |e|
        e.motion!

      end
      check

    end

    def print_stat
      @roads.each do |e|
        puts "\nRoad \##{e.to_s}\n\tsemafore is #{e.semafore.color}"
        e.transport.each do |t|
          puts "\t#{t.vid} is #{t.status}"

        end

      end

    end

private
    def check
      @crossroads.each do |x|
        crash = false
        x[:roads].each do |r|
          x[:roads].each do |z|
            if (r.semafore.color == :green || r.semafore.color == :broken) && (z.semafore.color == :green || z.semafore.color == :broken)
              r.cars_on_semafore.each do |car_r|
                z.cars_on_semafore.each do |car_z|

                  car_z.damage!
                  car_r.damage!
                  crash = true

                end

              end

            end if r != z

          end

        end if x[:roads].length > 1

        (puts "At the crossroad of roads:"; x[:roads].each { |e| p e.to_s }; puts "accident occurred!";) if crash

      end

    end

  end

end
