require_relative '../lib/semafore.rb'
require_relative '../lib/transport.rb'
require_relative '../lib/road.rb'
require_relative '../lib/crossroad.rb'
require 'test/unit'

module GameTmp
  class CrossRoad_Test < Test::Unit::TestCase

    def test_semafore_created
      semafore = Semafore.new place_point: 5
      assert_equal(:off, semafore.color)
      assert_equal(5, semafore.place_point)

    end

    def test_road_created
      semafore = Semafore.new place_point: 5
      road = Road.new semafore: semafore, length: 10, name: 1
      assert_equal(semafore, road.semafore)
      assert_equal(0, road.transport.length)

    end

    def test_road_add_transport
      semafore = Semafore.new place_point: 5
      road = Road.new semafore: semafore, length: 10, name: 1
      transport = Transport.new vid: :car, speed: 1, start_point: 2
      res = road.add_transport transport
      assert_equal(true, res)
      assert_equal(transport, road.transport[0])

    end

    def test_crossraod_created
      semafore = Semafore.new place_point: 5
      road = Road.new semafore: semafore, length: 10, name: 1
      crossraod = CrossRoad.new roads: [road]
      assert_equal([road], crossraod.roads)

    end

    def test_transport_created
      transport = Transport.new vid: :car, speed: 1, start_point: 2
      assert_equal(:car, transport.vid)
      assert_equal(1, transport.speed)
      assert_equal(2, transport.cur_point)
      assert_equal(:placed, transport.status)

    end

    def test_transport_possible_movement
      transport = Transport.new vid: :car, speed: 1, start_point: 0
      assert_equal(true, transport.possible_movement?(road_length: 5))

      transport = Transport.new vid: :car, speed: 1, start_point: 1
      assert_equal(true, transport.possible_movement?(road_length: 5))

      transport = Transport.new vid: :car, speed: -1, start_point: 5
      assert_equal(true, transport.possible_movement?(road_length: 5))

      transport = Transport.new vid: :car, speed: -1, start_point: 6
      assert_equal(false, transport.possible_movement?(road_length: 5))

    end

  end

end
