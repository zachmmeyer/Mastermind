# frozen_string_literal: true

require_relative './feedback'

# CodebreakerComputer Class
class CodebreakerComputer < Codebreaker
  def initialize
    super
    @possible_codes = %w[1 2 3 4 5 6].repeated_permutation(4).to_a.map(&:join)
    @previous_guess = ''
  end

  include Feedback

  def clear_and_prompt
    system('clear')
    puts 'Computer is The Codebreaker'
  end

  def input_guess
    if @turn.zero?
      @guess = '1122'
    else
      @possible_codes.delete(@previous_guess)
      new_possible_codes = @possible_codes.select { |possibility| (return_feedback(@previous_guess, possibility) == @feedback) }
      @possible_codes = new_possible_codes
      @guess = @possible_codes[0]
    end
    @previous_guess = @guess
    @guess
  end
end
