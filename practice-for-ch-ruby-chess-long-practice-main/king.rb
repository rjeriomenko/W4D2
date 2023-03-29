require_relative 'piece'
require_relative 'stepable'

class King < Piece
    include Stepable

    def symbol
        return :K
    end

    def move_diffs
        diffs = [
            [-1,0],
            [0,1],
            [1,0],
            [0,-1],
            [-1,1],
            [1,1],
            [1,-1],
            [-1,-1]
        ]
        possible_positions = diffs.map do |diff|
            diff_1, diff_2 = diff
            start_1, start_2 = pos
            [start_1 + diff_1, start_2 + diff_2]
        end
    end

end
