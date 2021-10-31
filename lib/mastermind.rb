# frozen_string_literal: true

require_relative './board'
require_relative './codebreakerplayer'
require_relative './codemakercomputer'

# TODO: Create classes that handle things that happen whether or not the maker/breaker is a player or a computer.
# TODO: Create Codebreaker and Codemaker classes
# TODO: Create Codebreakerplayer/Codebreakercomputer classes
# TODO: Create Codemakerplayer/Codemakercomputer classes

module Mastermind
  # Game class
  class Game
    def initialize
      @game_over_code = false
      @game_over_turns = false
      @board = Board.new
    end

    def game_over_codebreaker(winner)
      @codebreaker.clear_and_prompt
      @board.draw_board_and_turn
      puts @board.code
      puts "\nGame Over"
      puts "#{winner} Wins!"
    end

    def game_over_check
      @game_over_code = @board.check_for_game_over_code_match
      @game_over_turns = @board.check_for_game_over_too_many_turns
    end

    def update_code_and_guess
      @board.guess = @codebreaker.guess
      @board.code = @codemaker.code
    end

    def check_codebreaker_guess
      if @codebreaker.return_guess.match?(/^[1-6]{4}$/)
        @board.guess = @codebreaker.return_guess
        @board.parse_guess(@codebreaker.return_guess)
        @board.parse_feedback(@codemaker.return_feedback(@codebreaker.return_guess))
        update_code_and_guess
        @board.increment_turn
        game_over_check
      else
        codebreaker_round
      end
    end

    def codebreaker_round
      @codebreaker.clear_and_prompt
      @board.draw_board_and_turn
      # puts "Code: #{@board.code}"
      @codebreaker.input_guess
      check_codebreaker_guess
    end

    def start_codebreaker
      @codebreaker = CodebreakerPlayer.new
      @codemaker = CodemakerComputer.new
      # @board.code = @codemaker.code
      codebreaker_round until @game_over_code || @game_over_turns
      @game_over_code ? game_over_codebreaker('Codebreaker') : game_over_codebreaker('Codemaker')
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
