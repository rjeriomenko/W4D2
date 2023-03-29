module Stepable

    def moves # should return an array of valid end positions from move_diffs' possible moves
        moveable_directions = move_diffs.select { |position| valid_pos?(position) }
    end

    def move_diffs
        raise NotImplementedError
    end

    def valid_pos?(pos)
        piece = @board[pos]
        if piece
            if piece.color != @color
                return true
            end
        end

        false
    end


end
