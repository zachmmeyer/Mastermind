# frozen_string_literal: true

module Mastermind
  # Game class
  class Game
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

    def start
      system('clear')
      puts 'Welcome to Mastermind!'
      puts 'Press 1 to become The Codebreaker; Press 2 to become The Codemaker'
      player_choose_role
    end
  end
end

Mastermind::Game.new.start
