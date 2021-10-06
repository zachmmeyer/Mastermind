# frozen_string_literal: true

# Board class
class Board
  def initialize
    @guess_spaces = Array.new(12, Array.new(4, '_'))
    @feedback_spaces = Array.new(12, Array.new(4, '_'))
  end

  def input_guess(turn, input)
    modify_space(@guess_spaces, turn, input)
  end

  def print_board_line(space_type, first_index, spacer)
    output = ''
    space_type[first_index].each do |space|
      output += "#{space}#{spacer}"
    end
    output.delete_suffix('|')
  end

  def draw_board
    <<~BOARD
       _______   _______
      |#{print_board_line(@guess_spaces, 0, '|')}| |#{print_board_line(@feedback_spaces, 0, '|')}|
      |#{print_board_line(@guess_spaces, 1, '|')}| |#{print_board_line(@feedback_spaces, 1, '|')}|
      |#{print_board_line(@guess_spaces, 2, '|')}| |#{print_board_line(@feedback_spaces, 2, '|')}|
      |#{print_board_line(@guess_spaces, 3, '|')}| |#{print_board_line(@feedback_spaces, 3, '|')}|
      |#{print_board_line(@guess_spaces, 4, '|')}| |#{print_board_line(@feedback_spaces, 4, '|')}|
      |#{print_board_line(@guess_spaces, 5, '|')}| |#{print_board_line(@feedback_spaces, 5, '|')}|
      |#{print_board_line(@guess_spaces, 6, '|')}| |#{print_board_line(@feedback_spaces, 6, '|')}|
      |#{print_board_line(@guess_spaces, 7, '|')}| |#{print_board_line(@feedback_spaces, 7, '|')}|
      |#{print_board_line(@guess_spaces, 8, '|')}| |#{print_board_line(@feedback_spaces, 8, '|')}|
      |#{print_board_line(@guess_spaces, 9, '|')}| |#{print_board_line(@feedback_spaces, 9, '|')}|
      |#{print_board_line(@guess_spaces, 10, '|')}| |#{print_board_line(@feedback_spaces, 10, '|')}|
      |#{print_board_line(@guess_spaces, 11, '|')}| |#{print_board_line(@feedback_spaces, 11, '|')}|
    BOARD
  end

  private

  def modify_space(space, turn, input)
    space[(turn - 1)] = input
  end
end
