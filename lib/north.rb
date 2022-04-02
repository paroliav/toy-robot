class North
  def move(x:, y:)
    [x, y + 1]
  end

  def left
    West.new
  end

  def right
    East.new
  end

  def toString
    'NORTH'
  end
end