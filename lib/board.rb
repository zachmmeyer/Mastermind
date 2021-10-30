# frozen_string_literal: true

# Board class
class Board
  attr_accessor :code, :guess
  attr_reader :winner

  INTEGER_SIZE = 4
  GUESSES = 12

  def initialize
    @guess_spaces = Array.new(GUESSES, Array.new(INTEGER_SIZE, '_'))
    @feedback_spaces = Array.new(GUESSES, Array.new(INTEGER_SIZE, '_'))
    @turn = 0
    @code = 0
    @guess = 0
    @winner = ''
  end

  def check_for_game_over_too_many_turns
    @winner = 'Codemaker'
    true if @turn == GUESSES
  end

  def check_for_game_over_code_match
    @winner = 'Codebreaker'
    true if @code == @guess
  end

  def print_turn
    puts "Turn: #{@turn + 1}"
  end

  def increment_turn
    @turn += 1
  end

  def parse_guess(input)
    modify_space(@guess_spaces, input)
  end

  def parse_feedback(input)
    modify_space(@feedback_spaces, input)
  end

  def draw_board_and_turn
    print_turn
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
