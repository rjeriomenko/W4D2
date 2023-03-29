require_relative 'piece'

class Pawn < Piece

    def symbol
        return :P
    end

    def move_diffs
        white_diffs = [
            [1,0],
            [2,0],
            [1,-1],
            [1,1]
        ]
        black_diffs = [
            [-1,0],
            [-2,0],
            [-1,-1],
            [-1,1]
        ]
        diffs = white_diffs if @color == :white
        diffs = black_diffs if @color == :black
    end

end
