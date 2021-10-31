# frozen_string_literal: true

# CodemakerComputer class
class CodemakerComputer
  attr_reader :code

  def initialize
    @code = ''
    create_code
    # @code = '1122'
  end

  def fill_in_spaces(code, feedback)
    code.length - feedback.length
  end

  def inexact_match(filtered_code, guess)
    # TODO: Filter out guess of inexact matches
    # guess.chars.map.with_index do |char, index|
    count = 0
    filtered_code.each do |char|
      count += 1 if guess.include?(char)
    end
    count
  end

  def remove_exact_matches(code, guess)
    code.chars.map.with_index do |char, index|
      if guess[index] == char
        'exact match'
      else
        char
      end
    end
  end

  def return_feedback(guess)
    feedback = ''
    filtered_code = remove_exact_matches(@code, guess)
    (filtered_code.count 'exact match').times { feedback += '+' }
    inexact_match(filtered_code, guess).times { feedback += '-' }
    fill_in_spaces(@code, feedback).times { feedback += '_' }
    puts feedback
    feedback
  end

  private

  def create_code
    @code = rand(1111..6666).to_s until @code.match?(/^[1-6]{4}$/)
  end
end

# codemaker = CodemakerComputer.new

# codemaker.return_feedback('1122')
# codemaker.return_feedback('2211')
