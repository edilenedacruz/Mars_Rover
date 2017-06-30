require_relative 'validation'
require_relative 'messages'
require_relative 'rover'
require 'colorize'

class Runner
  include Validation
  include Messages

  attr_reader :max_x, :max_y
  attr_accessor :first_rover, :second_rover, :first_rover_pos

  def initialize
  end

  def start
    puts Messages.start.colorize(:green)
    size
  end

  def size
    puts Messages.plateau_size.colorize(:green)
    plateau = gets.chomp
    @max_x = plateau.split(" ")[0].to_i
    @max_y = plateau.split(" ")[1].to_i
    first_rover_position
  end

  def first_rover_position
    puts Messages.first_rover_position.colorize(:green)
    @first_rover_pos = gets.chomp.gsub(/\s+/, "").upcase
    if Validation.validate_position?(@first_rover_pos, @max_x, @max_y) == true
      first_rover_directions
    else
      puts Messages.invalid_position.colorize(:red)
      first_rover_position
    end
  end

  def first_rover_directions
    puts Messages.first_rover_directions.colorize(:green)
    @first_rover_inst = gets.chomp.upcase
    @one_r_final = Rover.new(first_rover_pos, max_x, max_y).dir_piece(@first_rover_inst)
    second_rover_position
  end

  def second_rover_position
    puts Messages.second_rover_position.colorize(:green)
    @second_rover_pos = gets.chomp.gsub(/\s+/, "").upcase
    if Validation.validate_position?(@second_rover_pos, @max_x, @max_y) == false
        puts Messages.invalid_position.colorize(:red)
        second_rover_position
    elsif
      Validation.validate_position?(@second_rover_pos, @max_x, @max_y) == true && Validation.second_rover_valid?(@one_r_final, @second_rover_pos) == true
      second_rover_directions
    else
      puts Messages.second_rover_error.colorize(:red)
      second_rover_position
    end
  end

  def second_rover_directions
    puts Messages.second_rover_directions.colorize(:green)
    second_rover_instructions = gets.chomp.upcase
    @sec_r_final = Rover.new(@second_rover_pos, max_x, max_y, @one_r_final).dir_piece(second_rover_instructions)
    final_print
  end

  def final_print
    puts "                 ".colorize(:background => :white)
    puts "#{@one_r_final}\n#{@sec_r_final}".colorize(:green)
  end
end

Runner.new.start
