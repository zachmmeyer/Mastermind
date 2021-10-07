# frozen_string_literal: true

require_relative './board'

module Mastermind
  # Game class
  class Game
    def initialize
      @game_over = false
      @board = Board.new
    end

    # TODO: Test input pattern to match 4 numbers

    def guess
      input = gets.chomp
      @board.input_guess(input)
    end

    def print_codebreaker_text
      system('clear')
      puts 'Player is The Codebreaker'
      puts @board.draw_board
      puts "\nInput your guess"
    end

    def start_codebreaker
      until @game_over
        print_codebreaker_text
        guess
      end
    end

    def player_choose_role
      player_choice = gets.chomp
      case player_choice
      when '1'
        start_codebreaker
      when '2'
        puts 'Player is The Codemaker'
      else
        start_game
      end
    end

    def start_game
      system('clear')
      puts 'Welcome to Mastermind!'
      puts 'Press 1 to become The Codebreaker; Press 2 to become The Codemaker'
      player_choose_role
    end
  end
end

Mastermind::Game.new.start_game
