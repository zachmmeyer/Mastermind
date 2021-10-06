# frozen_string_literal: true

require_relative './board'
require_relative './unicode'

module Mastermind
  # Game class
  class Game
    include Unicode
    def initialize
      @numbers_literal = %w[1 2 3 4]
      @number_symbols = %w[➊ ➋ ➌ ➍]
      @feedback_literal = ['+', '-', ' ']
      @feedback_symbols = %w[⊕ ⊖ ◯]
    end

    def match_number_to_input
      puts match_input_to_symbol(@numbers_literal, @number_symbols)
    end

    def match_feedback_to_input
      puts match_input_to_symbol(input, @feedback_literal, @feedback_symbols)
    end

    def player_choose_role
      player_choice = gets.chomp
      case player_choice
      when '1'
        puts 'Player is The Codebreaker'
      when '2'
        puts 'Player is The Codemaker'
      else
        start
      end
    end

    def display_intro
      system('clear')
      puts 'Welcome to Mastermind!'
      puts 'Press 1 to become The Codebreaker; Press 2 to become The Codemaker'
      player_choose_role
    end

    def start
      display_intro
      board = Board.new
      board.draw_board
    end
  end
end

# Mastermind::Game.new.start

Mastermind::Game.new.match_number_to_input
