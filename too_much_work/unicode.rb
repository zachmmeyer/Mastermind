# frozen_string_literal: true

# Module for dealing with the different unicode displayed on the board
module Unicode
  def match_input_to_symbol(output_literal, output_symbols)
    match_flag = false
    until match_flag
      input = gets.chomp
      output_literal.each_with_index do |item, index|
        if item == input
          match_flag = true
          return output_symbols[index]
        end
      end
    end
  end
end
