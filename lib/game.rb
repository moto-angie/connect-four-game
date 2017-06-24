require_relative 'board.rb'
require_relative 'player.rb'
require_relative 'turn.rb'
require 'pry'

# Takes player names
puts "Welcome to Connect 4! Player 1, please enter your name: "
player_1 = Player.new(gets.chomp.capitalize, "X")
puts "Player 1 is #{player_1.name}"
puts "Player 2, please enter your name: "
player_2 = Player.new(gets.chomp.capitalize, "O")

while player_2.name == player_1.name
  puts "Sorry, that name is taken. Please try a different name."
  puts "Player 2, please enter your name: "
  player_2 = Player.new(gets.chomp.capitalize)
end

puts "Player 2 is #{player_2.name}"

# Starts the game
new_game = Board.new
puts new_game.print

# Initiates first player's move
# print "#{player_1.name} choose the column to place your first piece: "
# player_1_column = gets.chomp.upcase
# while !letters.include?(player_1_column) do
#   puts "Sorry, that's not a valid column."
#   print "#{player_1.name} choose the column to place your first piece: "
#   player_1_column = gets.chomp.upcase
# end

game_win = false
letters = ["A", "B", "C", "D", "E", "F", "G"]

# Player 1

until game_win do
  print "#{player_1.name} choose the column to place your piece: "
  player_1_column = gets.chomp.upcase

  while !letters.include?(player_1_column) do
    puts "Sorry, that's not a valid column."
    print "#{player_1.name} choose the column to place your first piece: "
    player_1_column = gets.chomp.upcase
  end

  turn_1 = Turn.new(player_1, player_1_column, new_game)
  turn_1.drop
  if turn_1.drop == nil
    puts "Sorry, that column is full. Please choose another: "
    while !letters.include?(player_1_column) do
      print "Sorry, that's not a valid column. Choose the column to place your first piece: "
      player_1_column = gets.chomp.upcase
    end
  end

  new_game.print

  if turn_1.game_won? != false
    if turn_1.game_won? == 1
      puts "#{player_1} wins!"
    elsif turn_1.game_won? == 2
      puts "#{player_2} wins!"
    end
    break
  end

  # Player 2

  print "#{player_2.name} choose the column to place your piece: "
  player_2_column = gets.chomp.upcase

  while !letters.include?(player_2_column) do
    puts "Sorry, that's not a valid column."
    print "#{player_2.name} choose the column to place your first piece: "
    player_2_column = gets.chomp.upcase
  end

  turn_2 = Turn.new(player_2, player_2_column, new_game)
  turn_2.drop
  if turn_2.drop == nil
    puts "Sorry, that column is full. Please choose another: "
    while !letters.include?(player_2_column) do
      print "Sorry, that's not a valid column. Choose the column to place your first piece: "
      player_2_column = gets.chomp.upcase
    end
  end

  new_game.print

  if turn_2.game_won? != false
    if turn_2.game_won? == 1
      puts "#{player_1} wins!"
    elsif turn_2.game_won? == 2
      puts "#{player_2} wins!"
    end
    break
  end
end
