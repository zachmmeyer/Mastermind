# frozen_string_literal: true

# Codebreaker class
class Codebreaker
  attr_reader :guess
  attr_writer :feedback_exact, :feedback_inexact, :turn

  def initialize
    @guess = ''
    @feedback_inexact = 0
    @feedback_exact = 0
    @feedback_total = 0
    @guess_array = [1, 1, 1, 1]
    @turn = 0
    @previous_guesses = []
  end

  def return_guess
    @guess
  end
end
