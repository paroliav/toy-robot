require 'simulation'
require 'yaml'

RSpec.describe Simulation do

  before(:each) do
    @simulation = Simulation.new
  end

  describe :run do
    let!(:yaml) { YAML.load_file(File.join(__dir__, 'test_commands.yml')) }

    subject { @simulation.run(commands_set) }

    # PLACE 0,0,NORTH
    # MOVE
    # REPORT
    context 'Commands set 1' do
      let(:commands_set) { yaml['COMMANDS_SET_1'] }
      it { is_expected.to eq('0,1,NORTH') }
    end

    # PLACE 0,0,NORTH
    # LEFT
    # REPORT
    context 'Commands set 2' do
      let(:commands_set) { yaml['COMMANDS_SET_2'] }
      it { is_expected.to eq('0,0,WEST') }
    end

    # PLACE 1,2,EAST
    # MOVE
    # MOVE
    # LEFT
    # MOVE
    # REPORT
    context 'Commands set 3' do
      let(:commands_set) { yaml['COMMANDS_SET_3'] }
      it { is_expected.to eq('3,3,NORTH') }
    end

    # PLACE 6,2,EAST
    # LEFT
    # REPORT
    context 'Placing off the table' do
      let(:commands_set) { yaml['PLACE_OFF_TABLE'] }
      it { is_expected.to eq('0,0,WEST')}
    end

    # PLACE 4,2,SOUTH
    # MOVE
    # MOVE
    # MOVE
    # LEFT
    # MOVE
    # REPORT
    context 'Moving off table' do
      let(:commands_set) { yaml['MOVE_OFF_TABLE'] }
      it { is_expected.to eq('4,0,EAST') }
    end
  end
end