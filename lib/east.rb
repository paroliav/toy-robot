class East
  def move(x:, y:)
   [x+1, y]
  end

  def left
    North.new
  end

  def right
    South.new
  end

  def toString
    'EAST'
  end
end