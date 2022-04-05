require 'pawn'
require 'chessBoard'
RSpec.describe Pawn do
  let(:pawn) do
    described_class.new(0, 0, 0, 'NORTH', 'WHITE', ChessBoard.new)
  end

  describe "#position" do
    it { expect(pawn.position).to eq([0, 0, 'NORTH', 'WHITE']) }
  end

  describe "#change_face" do
    context "change direction to RIGHT" do
      it "changes from NORTH to EAST" do
        pawn.change_face("RIGHT")
        expect(pawn.position).to eq([0, 0, 'EAST', 'WHITE'])
      end
    end

    context "change direction to LEFT" do
      it "changes from NORTH to WEST" do
        pawn.change_face("LEFT")
        expect(pawn.position).to eq([0, 0, 'WEST', 'WHITE'])
      end
    end
  end

  describe "#move" do
    context "move not allowed" do
      it { expect { pawn.move(10) }.to output(/MOVE NOT ALLOWED/).to_stdout }
      it { expect { pawn.move(-1) }.to output(/MOVE NOT ALLOWED/).to_stdout }
    end

    context "move allowed" do
      it { expect { pawn.move(2) }.to output('').to_stdout }
    end
  end

  describe "#validate_if_first_move?" do
    context 'if it is a first move' do
      it { expect(pawn.validate_if_first_move?(1)).to eq(true) }
      it { expect(pawn.validate_if_first_move?(2)).to eq(true) }
    end

    context "if it is not the first move" do
      before do
        pawn.move(2)
      end
      it { expect(pawn.validate_if_first_move?(2)).to eq(false) }
      it { expect(pawn.validate_if_first_move?(1)).to eq(true) }
    end
  end

  describe "#coordinates_after_move" do
    context "when face NORTH" do
      it { expect(pawn.coordinates_after_move(1)).to eq([0, 1]) }
    end
    context "when face EAST" do
      before do
        pawn.change_face("RIGHT")
      end
      it { expect(pawn.coordinates_after_move(1)).to eq([1, 0]) }
    end
  end
end