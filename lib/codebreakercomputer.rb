# frozen_string_literal: true

# CodebreakerComputer Class
class CodebreakerComputer < Codebreaker
  def clear_and_prompt
    system('clear')
    puts 'Computer is The Codebreaker'
  end

  # Store all guesses
  # Make new guesses based on feedback received and stored guesses

  def input_guess
    puts "\nInput your guess"
    @guess = gets.chomp
  end
end
