# frozen_string_literal: true

require_relative './board'
require_relative './codebreaker'

module Mastermind
  # Game class
  class Game
    def initialize
      @game_over = false
      @board = Board.new
    end

    def guess
      input = gets.chomp
      @board.input_guess(input)
    end

    def start_codebreaker
      @codebreaker = Codebreaker.new
      until @game_over
        system('clear')
        puts 'Player is The Codebreaker'
        @board.draw_board
        @board.input_guess(@codebreaker.guess)
        @board.increment_turn
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
