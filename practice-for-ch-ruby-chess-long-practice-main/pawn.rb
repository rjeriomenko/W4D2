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

    def moves
        possible_positions = move_diffs.map do |diff|
            diff_1, diff_2 = diff
            start_1, start_2 = pos
            [start_1 + diff_1, start_2 + diff_2]
        end
        possible_positions.select do |position|
            pos_1, pos_2 = position
            piece = board[position]
            if piece
                if [-1,1].include?()
            else
                false
            end
        end
    end

    def forward_dir
        return 1 if @color == :white
        -1
    end

    def forward_steps
        steps = [[1*forward_dir,0]]
        steps << [2*forward_dir,0] if at_start_row?
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
