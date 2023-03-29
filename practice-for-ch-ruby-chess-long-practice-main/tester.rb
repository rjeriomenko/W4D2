require_relative 'board'

board = Board.new
# queen = Queen.new(:black, board, [])
n = King.new(:white, board, [])
board.add_piece(n, [2,2])
board.board_print
puts "--------------------------------"
p n.moves
# n.move_diffs
# board.move_piece([1, 4], [3, 4])
puts "--------------------------------"
# board.board_print
