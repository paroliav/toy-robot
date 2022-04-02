require 'robot'
require 'north'
require 'south'
require 'east'
require 'west'
require 'yaml'

RSpec.describe Robot do
  robot = Robot.new

  describe :place do
    subject { robot.place(x: x, y: y, face: face) }
    context '1, 2, NORTH' do
      let(:x) { 1 }
      let(:y) { 2 }
      let(:face) { North.new }

      it 'places robot' do
        subject
        expect(robot.x).to eq(x)
        expect(robot.y).to eq(y)
        expect(robot.face).to eq(face)
      end
    end

    context '2, 3, SOUTH' do
      let(:x) { 2 }
      let(:y) { 3 }
      let(:face) { South.new }

      it 'places robot' do
        subject
        expect(robot.x).to eq(x)
        expect(robot.y).to eq(y)
        expect(robot.face).to eq(face)
      end
    end

    context '3, 4, EAST' do
      let(:x) { 3 }
      let(:y) { 4 }
      let(:face) { East.new }

      it 'places robot' do
        subject
        expect(robot.x).to eq(x)
        expect(robot.y).to eq(y)
        expect(robot.face).to eq(face)
      end
    end

    context '4, 2, WEST' do
      let(:x) { 4 }
      let(:y) { 2 }
      let(:face) { West.new }

      it 'places robot' do
        subject
        expect(robot.x).to eq(x)
        expect(robot.y).to eq(y)
        expect(robot.face).to eq(face)
      end
    end
  end

  describe :move do
    subject do
      robot.place(x: 1, y: 3, face: face)
      robot.move
    end
    context 'facing NORTH' do
      let(:face) { North.new }
      it 'is expected to move north' do
        subject
        expect(robot.x).to eq(1)
        expect(robot.y).to eq(4)
        expect(robot.face).to eq(face)
      end
    end

    context 'facing SOUTH' do
      let(:face) { South.new }
      it 'is expected to move north' do
        subject
        expect(robot.x).to eq(1)
        expect(robot.y).to eq(2)
        expect(robot.face).to eq(face)
      end
    end

    context 'facing EAST' do
      let(:face) { East.new }
      it 'is expected to move north' do
        subject
        expect(robot.x).to eq(2)
        expect(robot.y).to eq(3)
        expect(robot.face).to eq(face)
      end
    end

    context 'facing WEST' do
      let(:face) { West.new }
      it 'is expected to move north' do
        subject
        expect(robot.x).to eq(0)
        expect(robot.y).to eq(3)
        expect(robot.face).to eq(face)
      end
    end
  end

  describe :left do
    subject do
      robot.place(x: 3, y: 2, face: face)
      robot.left
    end
    context 'facing NORTH' do
      let(:face) { North.new }
      it 'is expected turn WEST' do
        subject
        expect(robot.x).to eq(3)
        expect(robot.y).to eq(2)
        expect(robot.face).to be_an_instance_of(West)
      end
    end
    context 'facing SOUTH' do
      let(:face) { South.new }
      it 'is expected turn EAST' do
        subject
        expect(robot.x).to eq(3)
        expect(robot.y).to eq(2)
        expect(robot.face).to be_an_instance_of(East)
      end
    end
    context 'facing EAST' do
      let(:face) { East.new }
      it 'is expected turn NORTH' do
        subject
        expect(robot.x).to eq(3)
        expect(robot.y).to eq(2)
        expect(robot.face).to be_an_instance_of(North)
      end
    end
    context 'facing WEST' do
      let(:face) { West.new }
      it 'is expected turn SOUTH' do
        subject
        expect(robot.x).to eq(3)
        expect(robot.y).to eq(2)
        expect(robot.face).to be_an_instance_of(South)
      end
    end
  end

  describe :right do
    subject do
      robot.place(x: 3, y: 2, face: face)
      robot.right
    end
    context 'facing NORTH' do
      let(:face) { North.new }
      it 'is expected turn EAST' do
        subject
        expect(robot.x).to eq(3)
        expect(robot.y).to eq(2)
        expect(robot.face).to be_an_instance_of(East)
      end
    end
    context 'facing SOUTH' do
      let(:face) { South.new }
      it 'is expected turn West' do
        subject
        expect(robot.x).to eq(3)
        expect(robot.y).to eq(2)
        expect(robot.face).to be_an_instance_of(West)
      end
    end
    context 'facing EAST' do
      let(:face) { East.new }
      it 'is expected turn SOUTH' do
        subject
        expect(robot.x).to eq(3)
        expect(robot.y).to eq(2)
        expect(robot.face).to be_an_instance_of(South)
      end
    end
    context 'facing WEST' do
      let(:face) { West.new }
      it 'is expected turn NORTH' do
        subject
        expect(robot.x).to eq(3)
        expect(robot.y).to eq(2)
        expect(robot.face).to be_an_instance_of(North)
      end
    end
  end

  describe :report do
    subject do
      robot.place(x: 1, y: 4, face: East.new)
      robot.left
      robot.report
    end
    context 'reports current position' do
      it { is_expected.to eq('1,4,NORTH') }
    end

  end

end