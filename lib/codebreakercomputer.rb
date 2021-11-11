# frozen_string_literal: true

# CodebreakerComputer Class
class CodebreakerComputer < Codebreaker
  def initialize
    super
    @possible_codes = [1, 2, 3, 4, 5, 6].repeated_permutation(4)
  end

  def clear_and_prompt
    system('clear')
    puts 'Computer is The Codebreaker'
  end

  # Store all guesses
  # Make new guesses based on feedback received and stored guesses

  def input_guess
    # This here allows me to test and make sure guesses can be entered manually

    # puts "\nInput your guess"
    # @guess = gets.chomp

    # This mess below will get to being eventually having all the right numbers in the wrong place

    # @feedback_total = @feedback_inexact + @feedback_exact
    # @guess = if @turn.zero?
    #            @guess_array.join
    #          elsif @feedback_total.zero? && @turn.positive?
    #            (0..3).each do |number|
    #              @guess_array[number] += 1
    #            end
    #            @guess_array.join
    #          elsif @feedback_total == 1 && @turn.positive?
    #            (0..2).each do |number|
    #              @guess_array[number] += 1
    #            end
    #            @guess_array.join
    #          elsif @feedback_total == 2 && @turn.positive?
    #            (0..1).each do |number|
    #              @guess_array[number] += 1
    #            end
    #            @guess_array.join
    #           elsif @feedback_total == 3 && @turn.positive?
    #             (0..0).each do |number|
    #               @guess_array[number] += 1
    #             end
    #             @guess_array.join
    #           elsif @feedback_total == 4 && @turn.positive?
    #             @guess_array.shuffle!
    #             while @previous_guesses.include?(@guess_array.join)
    #               @guess_array.shuffle!
    #             end
    #             @previous_guesses.push(@guess_array.join)
    #             @guess_array.join
    #          end
  end
end
