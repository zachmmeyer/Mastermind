# frozen_string_literal: true

require_relative './feedback'
require 'pry'

# CodebreakerComputer Class
class CodebreakerComputer < Codebreaker
  def initialize
    super
    @possible_codes = ['1', '2', '3', '4', '5', '6'].repeated_permutation(4).to_a.map {|code| code.join}
    @previous_guess = ''
  end

  include Feedback

  def clear_and_prompt
    # system('clear')
    puts 'Computer is The Codebreaker'
  end

  # Store all guesses
  # Make new guesses based on feedback received and stored guesses

  def input_guess
    if @turn.zero?
      @guess = '1122'
    else
      @possible_codes.delete(@previous_guess)
      @possible_codes.each.with_index do |possibility, index|
       if return_feedback(@previous_guess, possibility) != @feedback
        @possible_codes.slice!(index)
        puts @possible_codes.include?(possibility)
      else
        puts "Does match: #{@previous_guess} and #{possibility}"
       end
      end
      @guess = @possible_codes[0]
    end
    p @possible_codes
    puts @feedback
    @previous_guess = @guess
    @guess
  end
end
