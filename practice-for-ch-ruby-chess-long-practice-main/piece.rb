class Piece
    attr_reader :color
    attr_writer :pos
    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def symbol
        return :P
    end
end
