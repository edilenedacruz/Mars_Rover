require_relative 'validation'

class Rover
  include Validation

  def initialize(position, max_x, max_y, first_rover_position = nil)
    @x = position.split("")[0].to_i
    @y = position.split("")[1].to_i
    @compass = position.split("")[-1]
    @max_x = max_x
    @max_y = max_y
    @first_rover_position = first_rover_position
  end


  def dir_piece(instructions)
    instructions.chars.map do |dir|
      case
        when dir == "L" then rotate_left
        when dir == "R" then rotate_right
        else move
      end
    end
    "" + @x.to_s + " " + @y.to_s + " " + @compass
  end

  def rotate_left
    case
      when @compass == "N" then @compass = "W"
      when @compass == "W" then @compass = "S"
      when @compass == "S" then @compass = "E"
      when @compass == "E" then @compass = "N"
    end
  end

  def rotate_right
    case
      when @compass == "N" then @compass = "E"
      when @compass == "W" then @compass = "N"
      when @compass == "S" then @compass = "W"
      when @compass == "E" then @compass = "S"
    end
  end

  def move
    if @first_rover_position.nil?
      move_first_rover
    else
      case
        when @compass == "N" then @y = Validation.second_rover_move_plus(@first_rover_position, @y)
        when @compass == "W" then @x = Validation.second_rover_move_less(@first_rover_position, @x)
        when @compass == "S" then @y = Validation.second_rover_move_less(@first_rover_position, @y)
        when @compass == "E" then @x = Validation.second_rover_move_plus(@first_rover_position, @x)
      end
    end
  end

  def move_first_rover
    case
    when @compass == "N" then @y = Validation.validate_increase(@y, @max_y)
    when @compass == "W" then @x = Validation.validate_decrease(@x)
    when @compass == "S" then @y = Validation.validate_decrease(@y)
    when @compass == "E" then @x = Validation.validate_increase(@x, @max_x)
    end
  end
end
