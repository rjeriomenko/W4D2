require_relative 'board'

board = Board.new
# queen = Queen.new(:BLACK, board, [])
r = Rook.new(:BLACK, board, [])
board.add_piece(r, [5,4])
board.board_print
puts "--------------------------------"
p r.moves
# board.move_piece([1, 4], [3, 4])
puts "--------------------------------"
# board.board_print
