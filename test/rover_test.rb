require_relative 'test_helper'
require_relative '../lib/rover'

class RoverTest < Minitest::Test

  def test_can_be_created_with_only_three_arguments
    rover = Rover.new("12N", 5, 5)
    assert Rover, rover
  end

  def test_second_rover_can_be_created
    rover = Rover.new("33E", 5, 5, "1 2 N")
    assert Rover, rover
  end

  def test_it_can_move_first_rover
    rover = Rover.new("12N", 5, 5)
    assert_equal "1 3 N", rover.dir_piece("LMLMLMLMM")
  end

  def test_it_can_move_second_rover
    rover = Rover.new("33E", 5, 5, "1 2 N")
    assert_equal "5 1 E", rover.dir_piece("MMRMMRMRRM")
  end

end
