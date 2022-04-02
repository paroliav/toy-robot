class West
  def move(x:, y:)
    [x-1, y]
  end

  def left
    South.new
  end

  def right
    North.new
  end

  def toString
    'WEST'
  end
end