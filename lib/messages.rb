module Messages
  def self.start
    "A squad of robotic rovers just landed in Mars. Please help us explore by giving these two rovers instructions."
  end

  def self.plateau_size
    "Please enter two digits between 1 and 9 to determine the size of the plateau:"
  end

  def self.first_rover_position
    "Please enter the position of the first rover. The format should be '3 4 N' using a letter representing one of the four cardinal compass points:"
  end

  def self.first_rover_directions
    "Now enter a series of letters that will spin the rover 90 degrees left or right without moving from the current spot. 'M' means move forward on grid point, maintainig the same heading."
  end

  def self.second_rover_position
    "Please provide the position for the second rover:"
  end

  def self.second_rover_directions
    "Please enter the directions for the second rover:"
  end

  def self.second_rover_error
    "The second rover cannot be placed in the same spot as the first rover. Please enter a new position:"
  end

  def self.invalid_position
    "Invalid position."
  end
end
