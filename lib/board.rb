# frozen_string_literal: true

# Board class
class Board
  INTEGER_SIZE = 4
  GUESSES = 12

  def initialize
    @guess_spaces = Array.new(GUESSES, Array.new(INTEGER_SIZE, '_'))
    @feedback_spaces = Array.new(GUESSES, Array.new(INTEGER_SIZE, '_'))
    @turn = 0
  end

  def check_for_game_over
    true if @turn == GUESSES
  end

  def return_turns
    @turns
  end

  def print_turn
    puts "Turn: #{@turn + 1}"
  end

  def increment_turn
    @turn += 1
  end

  # TODO: Test input pattern to match 4 numbers

  def input_guess(input)
    modify_space(@guess_spaces, input)
  end

  def draw_board
    puts ' _______   _______'
    GUESSES.times do |guess|
      puts "|#{@guess_spaces[guess].join('|')}| |#{@feedback_spaces[guess].join('|')}|"
    end
  end

  private

  def modify_space(space, input)
    space[@turn] = input.to_s.chars
  end
end
