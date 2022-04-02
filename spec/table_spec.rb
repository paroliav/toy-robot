require 'table'

RSpec.describe Table do
  table = Table.new

  describe 'dimensions' do
    subject { table.dimensions }
    context 'has dimensions' do
      it 'should be 5x5' do
        expect(subject[:length]).to eq(5)
        expect(subject[:width]).to eq(5)
      end
    end
  end

  describe 'isMoveSafe' do
    subject { table.isMoveSafe(x: x, y: y) }

    context 'when move is within boundaries' do
      let(:x) { 4 }
      let(:y) { 3 }

      it { expect(subject).to be_truthy }

    end

    context 'when move is outside boundaries' do
      let(:x) { 1 }
      let(:y) { 5 }

      it { expect(subject).to be_falsey }
    end
  end


end