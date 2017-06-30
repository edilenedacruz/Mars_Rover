require_relative 'test_helper'
require_relative '../lib/validation'

class ValidationTest < Minitest::Test
  def test_it_validates_rover_position
    position = Validation.validate_position?("12N", 5, 5)
    assert true, position
  end

  def test_it_provides_false_when_position_is_invalid
    position = Validation.validate_position?("56N", 5, 5)
    refute position
  end

  def test_increases_value_if_valid
    value = Validation.validate_increase(4, 5)
    assert_equal 5, value
  end

  def test_value_remains_the_same_if_value_if_invalid
    value = Validation.validate_increase(5, 5)
    assert_equal 5, value
  end

  def test_decreases_value_if_valid
    value = Validation.validate_decrease(1)
    assert_equal 0, value
  end

  def test_value_decreases
    value = Validation.validate_decrease(0)
    assert_equal 0, value
  end

  def test_confirms_second_rover_position_is_valid
    assert Validation.second_rover_valid?("1 2 N", "33E")
  end

  def test_refutes_second_rover_position_is_valid
    refute Validation.second_rover_valid?("1 2 N", "12E")
  end

  def test_second_rover_can_up_or_right
    assert_equal 4, Validation.second_rover_move_plus("1 3 N", 3)
  end

  def test_second_rover_cannot_move_up_or_right
    assert_equal 3, Validation.second_rover_move_plus("1 3 N", 2)
  end

  def test_second_rover_can_move_down_or_left
    assert_equal 0, Validation.second_rover_move_less("1 3 N", 1)
  end

  def test_second_rover_cannot_move_down_or_left
    assert_equal 0, Validation.second_rover_move_less("0 3 N", 1)
  end
end
