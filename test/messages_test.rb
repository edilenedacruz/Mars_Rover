require_relative 'test_helper'
require_relative '../lib/messages'

class MessagesTest < Minitest::Test
  def test_it_prints_start_message
    expected = "A squad of robotic rovers just landed in Mars. Please help us explore by giving these two rovers instructions."
    assert expected, Messages.start
  end

  def test_it_prints_plateau_size_message
    expected = "Please enter two single digits to determine the size of the plateau:"

    assert expected, Messages.plateau_size
  end

  def test_it_prints_first_rover_position
    expected = "Please enter the position of the first rover. The format should be '3 4 N' using a letter representing one of the four cardinal compass points:"

    assert expected, Messages.first_rover_position
  end

  def test_it_prints_first_rover_directions
    expected = "Now enter a series of letters that will spin the rover 90 degrees left or right without moving from the current spot. 'M' means move forward on grid point, maintainig the same heading."

    assert expected, Messages.first_rover_directions
  end

  def test_it_prints_second_rover_position
    expected = "Please provide the position for the second rover:"

    assert expected, Messages.second_rover_position
  end

  def test_it_prints_second_rover_directions
    expected = "Please enter the directions for the second rover:"

    assert expected, Messages.second_rover_directions
  end

  def test_it_prints_second_rover_error
    expected = "The second rover cannot be placed in the same spot as the first rover. Please enter a new position:"

    assert expected, Messages.second_rover_error
  end

  def test_it_prints_invalid_position_error

    assert "Invalid position.", Messages.invalid_position
  end
end
