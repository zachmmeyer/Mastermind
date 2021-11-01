# frozen_string_literal: true

require_relative 'codebreaker'

# Codebreaker class
class CodebreakerPlayer < Codebreaker
  def input_guess
    puts "\nInput your guess"
    @guess = gets.chomp
  end
end
