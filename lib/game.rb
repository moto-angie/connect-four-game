require_relative 'board.rb'
require_relative 'name.rb'
require_relative 'turn.rb'
require 'pry'

# Takes player names
puts "Welcome to Connect 4! Player 1, please enter your name: "
player_1 = Name.new(gets.chomp.capitalize)
puts "Player 1 is #{player_1.name}"
puts "Player 2, please enter your name: "
player_2 = Name.new(gets.chomp.capitalize)

while player_2.name == player_1.name
  puts "Sorry, that name is taken. Please try a different name."
  puts "Player 2, please enter your name: "
  player_2 = Name.new(gets.chomp.capitalize)
end

puts "Player 2 is #{player_2.name}"

# Starts the game
new_game = Board.new
puts new_game.print

# Initiates first player's move
print "#{player_1.name} choose the column to place your first piece: "
player_1_column = gets.chomp.upcase
while player_1_column != "A" && player_1_column != "B" && player_1_column != "C" && player_1_column != "D" && player_1_column != "E" && player_1_column != "F" && player_1_column != "G" do
  puts "Sorry, that's not a valid column."
  print "#{player_1.name} choose the column to place your first piece: "
  player_1_column = gets.chomp.upcase
end

game_winner = nil
while game_winner == nil do
  turn_1 = Turn.new(1, player_1_column)
  if turn_1.drop == nil
    puts "Sorry, that column is full. Please choose another: "
    while player_1_column != "A" && player_1_column != "B" && player_1_column != "C" && player_1_column != "D" && player_1_column != "E" && player_1_column != "F" && player_1_column != "G" do
      puts "Sorry, that's not a valid column."
      print "#{player_1.name} choose the column to place your first piece: "
      player_1_column = gets.chomp.upcase
    end
  end


end
