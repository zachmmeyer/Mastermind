# frozen_string_literal: true

# Codebreaker class
class Codebreaker
  def initialize
    @guess_input = ''
  end

  def reset_guess
    @guess_input = ''
  end

  def return_guess
    @guess_input
  end

  def clear_and_prompt
    system('clear')
    puts 'Player is The Codebreaker'
    puts 'Please input a 4-digit number'
  end

  def input_guess
    puts "\nInput your guess"
    @guess_input = gets.chomp
  end
end
