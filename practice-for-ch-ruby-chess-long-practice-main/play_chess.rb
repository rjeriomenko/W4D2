require_relative "game"

print "Enter white's name:"
player_1_name = gets.chomp
print "Enter black's name:"
player_2_name = gets.chomp

game = Game.new(player_1_name, player_2_name)
game.play
