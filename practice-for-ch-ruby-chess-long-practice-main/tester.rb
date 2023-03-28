require_relative 'board'

board = Board.new
board.board_print
board.move_piece([1, 4], [3, 4])
puts "--------------------------------"
board.board_print