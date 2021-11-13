# frozen_string_literal: true

require_relative 'codebreaker'

# CodebreakerPlayer class
class CodebreakerPlayer < Codebreaker
  def input_guess
    puts "\nInput your guess"
    @guess = gets.chomp
  end

  def clear_and_prompt
    # system('clear')
    puts 'Player is The Codebreaker'
    puts 'Please input a 4-digit number'
  end
end
