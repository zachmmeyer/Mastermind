# frozen_string_literal: true

require_relative 'codemaker'

# CodemakerComputer class
class CodemakerComputer < Codemaker
  def initialize
    super
    create_code
  end

  private

  def create_code
    @code = rand(1111..6666).to_s until @code.match?(/^[1-6]{4}$/)
  end
end
