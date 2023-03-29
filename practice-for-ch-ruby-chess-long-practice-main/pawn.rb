require_relative 'piece'

class Pawn < Piece

    def symbol
        return :P
    end

    def moves
        forward_steps
    end

    def forward_dir
        return 1 if @color == :white
        -1
    end

    def forward_steps
        steps = []
        start_1, start_2 = pos
        piece = @board[[start_1 + forward_dir, start_2]]
        
        if piece
            if piece.color == nil
                steps << [start_1 + forward_dir, start_2]
                piece = @board[[start_1 + 2 * forward_dir, start_2]]
                if piece
                    if piece.color == nil && at_start_row?
                        steps << [start_1 + 2 * forward_dir, start_2]
                    end
                end
            end
        end
        
        steps += side_attacks
    end

    def side_attacks
        sides = []
        start_1, start_2 = pos
        side_1_position = [start_1 + forward_dir, start_2-1]
        side_2_position = [start_1 + forward_dir, start_2+1]
        side_1 = @board[side_1_position]
        side_2 = @board[side_2_position]
        if side_1
            if side_1.color == ([:black, :white].reject{ |ele| ele == @color })[0]
                sides << side_1_position
            end
        end
        if side_2
            if side_2.color == ([:black, :white].reject{ |ele| ele == @color })[0]
                sides << side_2_position
            end
        end
        sides
    end

    def at_start_row?
        return true if pos[0] == 1 && @color == :white
        return true if pos[0] == 6 && @color == :black
        false
    end

end
