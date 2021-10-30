# frozen_string_literal: true

# CodemakerComputer class
class CodemakerComputer
  attr_reader :code

  def initialize
    @code = 0.to_s
    create_code
    # @code = '1122'
  end

  # 1212
  # 1124
  # +--

  def return_feedback(guess)
    feedback = ''

    # Putting this here because rubocop is upset
    puts guess

    # This is where my code would go
    # IF I HAD ANY

    (@code.length - feedback.length).times { feedback += '_' }
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
