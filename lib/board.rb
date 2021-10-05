# frozen_string_literal: true

require_relative './colors'

# Board class
class Board
  include Colors
  def layout_spaces(guess_spaces, feedback_spaces)
    guess_array = []
    feedback_array = []
    guess_spaces.each_slice(4) do |a|
      guess_array.push(color_board(a[0], a[1], a[2], a[3]))
    end
    feedback_spaces.each_slice(4) do |a|
      feedback_array.push(color_board(a[0], a[1], a[2], a[3]))
    end
    guess_array.zip(feedback_array).each_slice(1) do |a|
      puts "#{a[0][0]}#{a[0][1]}"
    end
  end

  def color_board(input1, input2, input3, input4)
    "\e[30;48;2;#{color_picker('board brown')}m #{input1} #{input2} #{input3} #{input4} \e[0m"
  end

  def initialize
    @guess_spaces = Array.new(48, '●')
    @feedback_spaces = Array.new(48, '◯')
  end

  def draw_board
    layout_spaces(@guess_spaces, @feedback_spaces)
  end
end

Board.new.draw_board

# Saved unicode for spaces
# ● ◯ ⊕ ⊖ ➊ ➋ ➌ ➍
