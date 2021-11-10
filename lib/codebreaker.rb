# frozen_string_literal: true

# Codebreaker class
class Codebreaker
  attr_reader :guess
  attr_writer :feedback_exact, :feedback_inexact

  def initialize
    @guess = ''
    @feedback_inexact = 0
    @feedback_exact = 0
  end

  def return_guess
    @guess
  end
end
