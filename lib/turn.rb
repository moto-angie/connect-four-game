require 'pry'
require_relative 'board.rb'
require_relative 'name.rb'

class Turn
attr_reader :player, :column, :player_piece
  def initialize(player, column, game_board)
    @player = player
    @column = column
    @board = game_board
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
    empty_slot = nil
    @board.rows.each_with_index do |row, index|
      # This probably needs to be reversed
      if row[@column] == "-"
        empty_slot = index
        break
      end
      break
    end
    if empty_slot == nil
      return nil
    else
      play = @board.rows[empty_slot][@column]
      @board.rows[empty_slot][@column] = @player_piece
      return play
    end
  end

  def row_win
    win = false
    row_count = 0
    pl1_piece_count = 0 # "X"
    pl2_piece_count = 0 # "O"
    while win == false
      @board.rows[row_count].each do |slot|

        if slot == "X"
          pl1_piece_count += 1
          pl2_piece_count = 0
        elsif slot == "O"
          pl2_piece_count += 1
          pl1_piece_count = 0
        elsif slot == "-"
          pl1_piece_count = 0
          pl2_piece_count = 0
        end

        if pl1_piece_count == 4 || if pl2_piece_count == 4
          win = true
        end

      end
      row_count += 1
    end
    win
  end

  def column_win
    win = false
    row_count = 0
    pl1_piece_count = 0 # "X"
    pl2_piece_count = 0 # "O"
    while win == false
      @board.rows[row_count][0].each do |slot|
        if slot == "X"
          pl1_piece_count += 1
          pl2_piece_count = 0
        elsif slot == "O"
          pl2_piece_count += 1
          pl1_piece_count = 0
        elsif slot == "-"
          pl1_piece_count = 0
          pl2_piece_count = 0
        end
        if pl1_piece_count == 4 || if pl2_piece_count == 4
          win = true
        end
      end
      row_count += 1
    end
    win
  end

  def game_won?
    game_winner = false
    if row_win == true || column_win == true
      if pl1_piece_count > pl2_piece_count
        game_winner = 1
      elsif pl2_piece_count > pl1_piece_count
        game_winner = 2
      end
    end
    game_winner
  end
end
