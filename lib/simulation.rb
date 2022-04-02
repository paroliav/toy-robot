require 'table'
require 'robot'
require 'north'
require 'south'
require 'west'
require 'east'

class Simulation
  def initialize
    @table = Table.new
    @robot = Robot.new
  end

  def run(commands_set)
    commands_set.split(/\n/).each do | command |
      if(command.start_with?('PLACE'))
        params = command.split(' ')[1].split(',')
        place(params)
      elsif(command == 'MOVE')
        move
      elsif(command == 'LEFT')
        @robot.left
      elsif(command == 'RIGHT')
        @robot.right
      else
        return @robot.report
      end
    end
  end

  def place(params)
    x = params[0].to_i
    y = params[1].to_i
    @robot.place(
        x: x,
        y: y,
        face: Object.const_get(params[2].capitalize).new
    ) if(@table.isMoveSafe(x: x, y: y))
  end

  def move
    x, y = @robot.face.move(x: @robot.x, y: @robot.y)
    @robot.move if(@table.isMoveSafe(x: x, y: y))
  end
end