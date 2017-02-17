module GameTmp
  class CrossRoad
    attr_reader :roads

    def initialize roads:
      @roads = roads

    end

    def check
      all_cars_stoped = true
      @roads.each do |e|
        e.motion!

      end

      @roads.each do |e|
        # poisk perekrestkov i check situacij na nem

      end

    end

  end

end
