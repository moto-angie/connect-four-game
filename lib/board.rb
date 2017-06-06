require_relative 'name.rb'

class Board
attr_accessor :board
  def initialize(rows = 6, columns = 7)
    @board = []
    rows.times do
      row = []
      columns.times do
        row << "-"
      end
      @board << row
    end
  end

  def rows
    @rows = @board
  end

  def print
    @game_board = " | "
    @board.each_with_index do |row, index|
      row.each do |square|
        if square.nil?
          @game_board += "-"
        else
          @game_board += " #{square} "
        end
      end
      @game_board += " | \n | "
    end
    @game_board += " A  B  C  D  E  F  G  |"
    @game_board
  end
end
