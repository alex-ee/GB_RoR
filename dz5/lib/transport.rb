module GameTmp
  class Transport
    attr_reader :cur_point, :health
    attr_accessor :status

    def initialize vid:, speed:, start_point:
      @vid = vid
      @speed = speed
      @health = 100
      @cur_point = start_point

    end

    def move!
      @cur_point += @speed

    end

    def possible_movement? road_length:
      0 > @cur_point && @cur_point < road_length && !broken?

    end

    def damage!
      @health = 0

    end

    def broken?
      @health == 0

    end

  end

end
