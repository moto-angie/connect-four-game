require 'pry'
require_relative 'board.rb'
require_relative 'player.rb'

class Turn
attr_reader :player, :column
  def initialize(player, column, game_board)
    @player = player
    @column = column
    @board = game_board
    column_conversion
  end

  def column_conversion
    letters_array = ["A", "B", "C", "D", "E", "F", "G"]
    index_column = letters_array.index(@column)
    @column = index_column
  end

  def drop
    empty_slot = nil
    @board.rows.each_with_index do |row, index|
      if row.all? { |slot| slot == "-" }
        empty_slot = @column[-1]
      elsif row[@column] != "-"
        empty_slot = index -1
        break
      end
      break
    end

    if empty_slot == nil
      nil
    else
      play = @board.rows[empty_slot][@column]
      @board.rows[empty_slot][@column] = @player.piece
      play
    end
  end

  def row_win
    win = false
    # row_count = 0
    pl1_piece_count = 0 # "X"
    pl2_piece_count = 0 # "O"
    while win == false do
      @board.rows.each do |slot|

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

        if pl1_piece_count == 4 || pl2_piece_count == 4
          win = true
        end

      end
      # row_count += 1
    end
    win
  end

  def column_win
    column_to_check = []
    @board.rows.each do |row|
      column_to_check << row[@column]
    end
    column_to_check.join("")
    winning_string = "#{@player.piece}#{@player.piece}#{@player.piece}#{@player.piece}"
    column_to_check.include?(winning_string)



    # win = false
    # row_count = 0
    # pl1_piece_count = 0 # "X"
    # pl2_piece_count = 0 # "O"
    # while win == false do
    #   @board.rows[row_count][0].each do |slot|
    #     if slot == "X"
    #       pl1_piece_count += 1
    #       pl2_piece_count = 0
    #     elsif slot == "O"
    #       pl2_piece_count += 1
    #       pl1_piece_count = 0
    #     elsif slot == "-"
    #       pl1_piece_count = 0
    #       pl2_piece_count = 0
    #     end
    #     if pl1_piece_count == 4 || pl2_piece_count == 4
    #       win = true
    #     end
    #   end
    #   row_count += 1
    # end
    # win
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
