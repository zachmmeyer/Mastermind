# frozen_string_literal: true

require_relative './feedback'

# CodemakerComputer class
class Codemaker
  attr_reader :code, :feedback_inexact, :feedback_exact

  def initialize
    @code = ''
    @feedback_inexact = 0
    @feedback_exact = 0
  end
  include Feedback
end
