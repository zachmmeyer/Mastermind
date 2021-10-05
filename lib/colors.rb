# frozen_string_literal: true

# module for handling text and background Colors
module Colors
  def color_picker(color)
    case color
    when 'board brown'
      '213;145;108'
    else
      'No such color'
    end
  end
end
