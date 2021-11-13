# frozen_string_literal: true

# Codebreaker class
class Codebreaker
  attr_reader :guess
  attr_writer :feedback, :turn

  def initialize
    @guess = ''
    @feedback = ''
    @guess_array = [1, 1, 1, 1]
    @turn = 0
    @previous_guesses = []
  end

  def return_guess
    @guess
  end
end
