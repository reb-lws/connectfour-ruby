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

    context "#display_board" do
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

  end
end
