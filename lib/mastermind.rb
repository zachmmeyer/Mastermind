# frozen_string_literal: true

require_relative './board'
require_relative './codebreakerplayer'
require_relative './codemakercomputer'
require_relative './codebreakercomputer'
require_relative './codemakerplayer'

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

    def parse_codebreaker_guess(return_codebreaker_guess)
      @board.guess = return_codebreaker_guess
      @board.parse_guess(return_codebreaker_guess)
    end

    def return_feedback(return_codebreaker_guess)
      feedback = @codemaker.return_feedback(@codemaker.code, return_codebreaker_guess)
      @board.parse_feedback(feedback)
      @codebreaker.feedback = feedback
      @board.increment_turn
      @codebreaker.turn = @board.turn
    end

    def check_codebreaker_guess
      return_codebreaker_guess = @codebreaker.return_guess
      if return_codebreaker_guess.match?(/^[1-6]{4}$/)
        parse_codebreaker_guess(return_codebreaker_guess)
        return_feedback(return_codebreaker_guess)
        game_over_check
      else
        codebreaker_round
      end
    end

    def codebreaker_round
      @codebreaker.clear_and_prompt
      @board.draw_board_and_turn
      @codebreaker.input_guess
      check_codebreaker_guess
    end

    def create_codebreaker_player_instances
      @codebreaker = CodebreakerPlayer.new
      @codemaker = CodemakerComputer.new
    end

    def start_codebreaker
      create_codebreaker_player_instances
      @board.code = @codemaker.code
      codebreaker_round until @game_over_code || @game_over_turns
      @game_over_code ? game_over_codebreaker('Codebreaker') : game_over_codebreaker('Codemaker')
    end

    # Player Codemaker specific logic starts here

    def codemaker_round
      @codebreaker.clear_and_prompt
      @board.draw_board_and_turn
      @codebreaker.input_guess
      check_codebreaker_guess
    end

    def start_codemaker
      @codebreaker = CodebreakerComputer.new
      @codemaker = CodemakerPlayer.new
      @codemaker.input_code
      @board.code = @codemaker.code
      codemaker_round until @game_over_code || @game_over_turns
      @game_over_code ? game_over_codebreaker('Codebreaker') : game_over_codebreaker('Codemaker')
    end

    # Player Codemaker specific logic ends here

    def player_choose_role
      player_choice = gets.chomp
      case player_choice
      when '1'
        start_codebreaker
      when '2'
        start_codemaker
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
