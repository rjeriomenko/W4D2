module Stepable
    
    def moves # should return an array of valid end positions from move_diffs' possible moves
        moveable_directions = move_diffs.select { |position| valid_pos?(position) }
    end

    def move_diffs # should return array of possible moves ##################PICK UP HEEEERERERERERERE
        #probably going to be king's moveset
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
