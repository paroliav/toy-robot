class South
  def move(x:, y:)
    [x, y-1]
  end

  def left
    East.new
  end

  def right
    West.new
  end

  def toString
    'SOUTH'
  end
end