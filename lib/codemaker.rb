# frozen_string_literal: true

# CodemakerComputer class
class Codemaker
  attr_reader :code

  def initialize
    @code = ''
  end

  def fill_in_spaces(code, feedback)
    code.length - feedback.length
  end

  def filter_exact_matches(filtered_code, filtered_code_hash)
    filtered_code.each do |char|
      filtered_code_hash[char] += 1 unless char == 'exact match'
    end
  end

  def inexact_match(filtered_code, filtered_guess)
    filtered_code_hash = Hash.new(0)
    filter_exact_matches(filtered_code, filtered_code_hash)
    count = 0
    filtered_code.each do |char|
      if filtered_guess.include?(char) && filtered_code_hash[char].positive?
        count += 1
        filtered_code_hash[char] -= 1
      end
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
    filtered_guess = remove_exact_matches(guess, @code)
    (filtered_code.count 'exact match').times { feedback += '+' }
    inexact_match(filtered_code, filtered_guess).times { feedback += '-' }
    fill_in_spaces(@code, feedback).times { feedback += '_' }
    feedback
  end
end
