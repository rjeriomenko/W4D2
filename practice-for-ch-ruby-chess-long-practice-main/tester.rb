require_relative 'board'

board = Board.new
queen = Queen.new(:B, board, [])
board.add_piece(queen, [5,4])
board.board_print
puts "--------------------------------"
p queen.moves
# board.move_piece([1, 4], [3, 4])
puts "--------------------------------"
# board.board_print
