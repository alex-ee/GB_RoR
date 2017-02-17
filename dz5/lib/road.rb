module GameTmp
  class Road
    def initialize length:, semafore:
      @length = length
      @semafore = semafore
      @transport = []

    end

    def add_transport item
      all_ok = true
      @transport.each do |e|
        all_ok = false if e.cur_point == item.cur_point | !item.possible_movement?(@length)

      end
      @transport.push item if all_ok
      all_ok

    end

    def motion!
      @transport.each do |e|
        if e.cur_point == @semafore.place_point
          tmp = @semafore.cur_light
          e.move! if (tmp == :green | tmp == :broken) && e.possible_movement?(@length)

        else
          e.move! if e.possible_movement?(@length)

        end

      end

    end

  end
  
end
