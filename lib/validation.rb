require 'pry'

module Validation
  def self.validate_position?(position, max_x, max_y)
    min_x = 0 && min_y = 0

    x = position.split("")[0].to_i
    y = position.split("")[1].to_i

    x > max_x || x < min_x || y > max_y || y < min_y ? false : true
  end

  def self.validate_increase(current, max)
    current + 1 > max ? current : current + 1
  end

  def self.validate_decrease(current)
    current - 1 < 0 ? current : current - 1
  end

  def self.second_rover_valid?(first_rover_final, second_rover_position)
    first_rover_final.chop.gsub(/\s+/, "") == second_rover_position.chop ? false : true
  end

  def self.second_rover_move_plus(first_rover_final, x)
    first_rover_final.split(" ")[1] == x + 1 ? x : x + 1
  end

  def self.second_rover_move_less(first_rover_final, x)
    first_rover_final.split(" ")[0] == x - 1 ? x : x - 1
  end
end
