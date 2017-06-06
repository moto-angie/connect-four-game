require 'pry'
require_relative 'board.rb'
require_relative 'name.rb'

class Turn
attr_reader :player, :column, :player_piece
  def initialize(player, column)
    @player = player
    @column = column
    player_conversion
    column_conversion
    drop
  end

  def player_conversion
    if @player == 1
      @player_piece = " X "
    elsif @player == 2
      @player_piece = " O "
    end
  end

  def column_conversion
    if @column == "A"
      @column = 0
    elsif @column == "B"
      @column = 1
    elsif @column == "C"
      @column = 2
    elsif @column == "D"
      @column = 3
    elsif @column == "E"
      @column = 4
    elsif @column == "F"
      @column = 5
    else @column == "G"
      @column = 6
    end
  end

  def drop
    print @board
    # if @board[5][@column] == "-"
    #   @board[5][@column] = @player_piece
    # elsif @board[4][@column] == "-"
    #   @board[4][@column] = @player_piece
    # elsif @board[3][@column] == "-"
    #   @board[3][@column] = @player_piece
    # elsif @board[2][@column] == "-"
    #   @board[2][@column] = @player_piece
    # elsif @board[1][@column] == "-"
    #   @board[1][@column] = @player_piece
    # elsif @board[0][@column] == "-"
    #   @board[0][@column] = @player_piece
    # else return nil
    # end
  end

  def winner?

  end

end

# player chooses column
# turn places correct game piece in the first available slot
# game checks for a win
#   if there is a win, game stops and winner is announced
# return the game board for the next player to choose
# board[5][0]
# [
#   [" - ", " - ", nil, nil, nil, nil, nil],
#   [" - ", " - ", nil, nil, nil, nil, nil],
#   [" - ", " - ", nil, nil, nil, nil, nil],
#   [" - ", " - ", nil, nil, nil, nil, nil],
#   [" - ", " - ", nil, nil, nil, nil, nil],
#   ['X', " - ", nil, nil, nil, nil, nil]
# ]
