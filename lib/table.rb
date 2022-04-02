class Table

  def initialize
    @length = 5
    @width = 5
  end

  def dimensions
    { length: @length, width: @width }
  end

  def isMoveSafe(x:, y:)
    if(x < 0 || x >= @length || y < 0 || y >= @width)
      return false
    end
    return true
  end

end