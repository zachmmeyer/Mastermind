# frozen_string_literal: true

# Codebreaker class
class Codebreaker
  attr_reader :guess

  def initialize
    @guess = ''
  end

  def return_guess
    @guess
  end

  def clear_and_prompt
    system('clear')
    puts 'Player is The Codebreaker'
    puts 'Please input a 4-digit number'
  end
end
