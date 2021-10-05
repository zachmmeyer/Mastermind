# frozen_string_literal: true

# Board class
class Board
  def initialize
    @guess_spaces = Array.new(48, '●')
    @feedback_spaces = Array.new(48, '◯')
  end
end
