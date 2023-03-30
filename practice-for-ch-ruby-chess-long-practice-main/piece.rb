class Piece
    attr_reader :color
    attr_accessor :pos

    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def symbol
        return :P
    end

    def move_into_check?(end_pos)
        serialized_board = Marshal.dump(@board)
        temp_board = Marshal.load(serialized_board)
        
        temp_board.move_piece(@pos, end_pos)
        temp_board.in_check?(@color)
    end
end
