module GameTmp
  class Semafore
    attr_reader :place_point, :status

    def initialize place_point:
      @place_point = place_point
      @colors = [:red, :yellow, :green]
      @step = 1

    end

    def cur_light
      val = 3 - @step
      if val < 0
        val = 1
        @step = 1

      elsif val > 2
        val = 1
        @step = -1

      end
      @status = @colors[val]

      tmp = rand(4)
      @status = :broken if tmp == 4

      @colors[val]
      :broken if tmp == 4

    end

  end
  
end
