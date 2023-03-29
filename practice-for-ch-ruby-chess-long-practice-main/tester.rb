require_relative 'board'
require_relative 'display'
require_relative 'cursor'

puts "--------------------------------"
board = Board.new
# board.board_print
display = Display.new(board)
display.render
display.cursor.get_input
puts "--------------------------------"
display.render
display.cursor.get_input
puts "--------------------------------"
display.render


puts "--------------------------------"