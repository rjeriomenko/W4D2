require_relative 'board'
require_relative 'display'
require_relative 'cursor'
require_relative 'game'

puts "--------------------------------"
board = Board.new
# board.board_print
display = Display.new(board)
display.render
p board.checkmate?(:white)
p board.checkmate?(:black)
# display.cursor.get_input
# puts "--------------------------------"
# display.render
# display.cursor.get_input
# puts "--------------------------------"
# display.render

# g = Game.new
# g.play
puts "--------------------------------"

# old_board = Board.new
# p old_board
# p old_board.object_id
# p old_board.rows.object_id
# p old_board[[1,2]].object_id
# puts "----------------"
# serialized_board = Marshal.dump(old_board)
# new_board = Marshal.load(serialized_board)
# p new_board
# p new_board.object_id
# p new_board.rows.object_id
# p new_board[[1,2]].object_id

