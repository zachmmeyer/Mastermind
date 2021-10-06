# frozen_string_literal: true

require_relative './colors'

# Board class
class Board
  include Colors
  def layout_spaces(guess_spaces, feedback_spaces)
    guess_array = []
    feedback_array = []

    color_spaces(guess_spaces, guess_array)
    color_spaces(feedback_spaces, feedback_array)
    guess_array.zip(feedback_array).each_slice(1) do |space|
      puts "#{space[0][0]}#{space[0][1]}"
    end
  end

  def color_spaces(spaces, space_array)
    spaces.each_slice(4) do |space|
      space_array.push(color_board(space))
    end
  end

  def line_spreader(spaces)
    "#{spaces[0]} #{spaces[1]} #{spaces[2]} #{spaces[3]}"
  end

  def color_board(spaces)
    "\e[30;48;2;#{color_picker('board brown')}m #{line_spreader(spaces)} \e[0m"
  end

  def initialize
    @guess_spaces = Array.new(48, '●')
    @feedback_spaces = Array.new(48, '◯')
  end

  def draw_board
    layout_spaces(@guess_spaces, @feedback_spaces)
  end
end

# Board.new.draw_board
