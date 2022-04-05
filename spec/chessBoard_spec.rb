require 'pawn'
require 'chessBoard'

RSpec.describe ChessBoard do
  let(:chessBoard) do
    described_class.new
  end

  describe "#report" do
    context 'if no pawn placed' do
      it 'throws error' do
        expect { chessBoard.report }.to output(/You need to place atleast one pawn on the board/).to_stdout
      end
    end

    context "pawn is placed" do
      before(:example) do
        chessBoard.place(0, 0, 'NORTH', 'WHITE')
      end
      it { expect { chessBoard.report }.to output("x: 0\ny: 0\nFace: NORTH\nColor: WHITE\n").to_stdout }
    end
  end

  describe "#move" do
    context 'if no pawn placed' do
      it 'throws error' do
        expect { chessBoard.report }.to output(/You need to place atleast one pawn on the board/).to_stdout
      end
    end

    context 'atleast one pawn is place' do
      before do
        chessBoard.place(0, 0, 'NORTH', 'WHITE')
      end

      it 'should allow pawn to move by 1' do
        expect { chessBoard.move(1) }.to output(//).to_stdout
      end

      context "invalid move" do
        before do
          chessBoard.change_direction("LEFT")
        end
        it 'pawn not allowed to go beyound the chess board' do
          expect { chessBoard.move(1) }.to output(/MOVE NOT ALLOWED/).to_stdout
        end
      end
    end
  end

  describe "#place" do
    context "if x,y not in board" do
      it "should show error" do
        expect { chessBoard.place(10, 10, 'NORTH', 'COLOR').to output(/Pick the correct co-ordinates/).to_stdout }
      end
    end

    # Need help
    # context "if x,y valid" do
    #   it "increase the count by 1" do
    #     puts described_class.instance_variable_get(:@count)
    #     expect { chessBoard.place(0, 0, 'NORTH', 'BLACK') }.to change { described_class.instance_variable_get(:@count) }
    #   end
    # end
  end

  describe "#change_direction" do
    context 'if no pawn placed' do
      it 'throws error' do
        expect { chessBoard.change_direction("LEFT") }.to output(/You need to place atleast one pawn on the board/).to_stdout
      end
    end

    context 'if pawn is placed' do
      before do
        chessBoard.place(0, 0, 'NORTH', 'BLACK')
      end

      it 'should change the current position of the pawn' do
        expect { chessBoard.change_direction('LEFT') }.to output(//).to_stdout
      end
    end
  end
end