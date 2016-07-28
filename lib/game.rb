require_relative "player"
require_relative "cell"

class Game
  attr_reader :board, :player1, :player2

  def initialize
    board = Array.new
    7.times do
      board << Array.new
    end

    @board = board
    @player1 = Player.new("O")
    @player2 = Player.new("X")
  end

  # Return string representation of @board.
  def display_board
    board_str = String.new

    rows_board = row_shift(@board)
    rows_board.each do |row|
      row_str = "|"
      row.each { |cell| cell.nil? ? row_str += "_|" : row_str += "#{cell.side}|" }
      row_str += "\n"
      board_str += row_str
    end

    column_numbers = " 1 2 3 4 5 6 7 "
    board_str += column_numbers
    return board_str
  end

  private
  # Return an array where each array represents a row-column
  def row_shift(board)
    board_rows = Array.new
    6.times do
      row_ary = Array.new

      board.each { |column| row_ary << column.shift }
      board_rows << row_ary
    end
    board_rows.reverse # Reverse the arrays to bring the rows upside down
  end
end