# frozen_string_literal: true

module Mastermind
  # Game class
  class Game
    def start
      system('clear')
      puts 'Welcome to Mastermind!'
      puts 'Press 1 to become The Codebreaker; Press 2 to become The Codemaker'
  end
end

Mastermind::Game.new.start
