# frozen_string_literal: true

# CodemakerComputer class
class CodemakerComputer
  attr_reader :code

  def initialize
    @code = 0.to_s
    create_code
  end

  private

  def create_code
    @code = rand(1111..6666).to_s until @code.match?(/^[1-6]{4}$/)
  end
end
