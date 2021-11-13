# frozen_string_literal: true

# CodebreakerComputer Class
class CodebreakerComputer < Codebreaker
  def initialize
    super
    @possible_codes = [1, 2, 3, 4, 5, 6].repeated_permutation(4).to_a
  end

  def clear_and_prompt
    system('clear')
    puts 'Computer is The Codebreaker'
  end

  # Store all guesses
  # Make new guesses based on feedback received and stored guesses


  def input_guess
    # p @possible_codes
    # gets.chomp
    # This here allows me to test and make sure guesses can be entered manually

    # puts "\nInput your guess"
    # @guess = gets.chomp


  end
end
