# frozen_string_literal: true

# CodeBreakerPlayer Class
class CodeBreakerPlayer
  def initialize
    puts 'Hey delete me'
  end
end
# frozen_string_literal: true

require_relative 'codemaker'

# CodemakerPlayer class
class CodemakerPlayer < Codemaker
  def input_code
    system('clear')
    puts "\nInput your code"
    @code = gets.chomp until @code.match?(/^[1-6]{4}$/)
  end
end
