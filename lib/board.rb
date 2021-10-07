# frozen_string_literal: true

# Board class
class Board
  # TODO: Figure out where to move these instance variables
  def initialize
    @guesses = 12
    @integer_size = 4
    @guess_spaces = Array.new(12, Array.new(@integer_size, '_'))
    @feedback_spaces = Array.new(12, Array.new(@integer_size, '_'))
    @turn = 0
  end

  def input_guess(input)
    modify_space(@guess_spaces, input)
  end

  def draw_board
    puts ' _______   _______'
    @guesses.times do |guess|
      puts "|#{print_board_line(@guess_spaces, guess)}| |#{print_board_line(@feedback_spaces, guess)}|"
    end
  end

  private

  def modify_space(space, input)
    space[@turn] = input.to_s.chars
  end

  def print_board_line(space_type, turn)
    output = ''
    space_type[turn].each_with_index do |space, index|
      output = output + space.to_s + (index == @integer_size - 1 ? '' : '|')
    end
    output
  end
end
