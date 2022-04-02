require 'north'

class Robot
  attr_reader :x, :y, :face

  def initialize
    @x = 0
    @y = 0
    @face = North.new
  end

  def place(x:, y:, face:)
    @x = x
    @y = y
    @face = face
  end

  def move
    @x, @y = @face.move(x:@x, y:@y)
  end

  def left
    @face = @face.left
  end

  def right
    @face = @face.right
  end

  def report
    "#{@x},#{@y},#{@face.toString}"
  end


end