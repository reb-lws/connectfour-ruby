require "game"

describe Game do
  context "on game initialization" do
    let(:empty_game) { Game.new }

    it "has a board" do
      expect(empty_game).to respond_to(:board)
    end

    it "has 2 players" do
      expect(empty_game).to respond_to(:player1)
      expect(empty_game).to respond_to(:player2)
    end

    it "has a board containing 7 arrays" do
      expect(empty_game.board.size).to eql (7)
    end

    it "displays an empty board" do
      empty_board_string = String.new
      6.times do
        row = "|"
        7.times { row += "_|" }
        row += "\n"
        empty_board_string += row
      end

      empty_board_string += " 1 2 3 4 5 6 7 "

      expect(empty_game.display_board).to eql(empty_board_string)
    end
  end

  describe "#add_cell" do

    subject { Game.new }

    context "adding a cell on an empty board" do
      it "should be pushed onto a column" do
        test_cell = Cell.new("X")
        subject.add_cell(2, Cell.new("X"))
        expect(subject.board[2].first.side).to eql(test_cell.side)
      end

      it "should stack cells on top of each other" do
        cell1 = Cell.new("O")
        cell2 = Cell.new("X")
        subject.add_cell(0, cell1)
        subject.add_cell(0, cell2)
        target_col = subject.board.first
        expect(target_col.first.side).to eql("O")
        expect(target_col.last.side).to eql("X")
        expect(target_col.size).to eql(2)
      end
    end

    context "on a full column" do
      it "forbids adding new cells" do
        6.times do
          subject.add_cell(5, Cell.new("X"))
        end
        subject.add_cell(5, Cell.new("O"))
        target_col = subject.board[5]
        expect(target_col.size).to eql(6)
        expect(target_col.last.side).to eql("X")
      end
    end
  end
end
