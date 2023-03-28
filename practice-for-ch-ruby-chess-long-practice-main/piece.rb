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

    def valid_moves # will call subclass.moves to generate list of possible moves
        # basically the same thing as move
    end
end
