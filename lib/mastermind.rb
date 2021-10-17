# frozen_string_literal: true

require_relative './board'
require_relative './codebreakerplayer'
require_relative './codemakercomputer'

module Mastermind
  # Game class
  class Game
    def initialize
      @game_over = false
      @board = Board.new
      @winner = ''
    end

    def game_over_codebreaker
      @codebreaker.clear_and_prompt
      @board.draw_board_and_turn
      puts "\nGame Over"
      puts "#{@winner} Wins!"
    end

    def check_codebreaker_guess
      if @codebreaker.return_guess.match?(/^[1-6]{4}$/)
        @board.parse_guess(@codebreaker.return_guess)
        @codebreaker.reset_guess
        @board.increment_turn
        @game_over = @board.check_for_game_over
      else
        codebreaker_round
      end
    end

    def codebreaker_round
      @codebreaker.clear_and_prompt
      @board.draw_board_and_turn
      puts @board.code
      @codebreaker.input_guess
      check_codebreaker_guess
    end

    def start_codebreaker
      @codebreaker = CodebreakerPlayer.new
      @codemaker = CodemakerComputer.new
      @board.code = @codemaker.code
      codebreaker_round until @game_over
      game_over_codebreaker
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
