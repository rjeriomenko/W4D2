module Slideable
    HORIZONTAL_DIRS = [:up, :right, :down, :left]
    DIAGONAL_DIRS = [:up_right, :down_right, :down_left, :up_left]

    def moves # should return an array of end_pos
        moveable_directions = move_dirs

    end

    def move_dirs
        horizontal_dirs + diagonal_dirs
    end

    def horizontal_dirs
        end_pos_array = []
        HORIZONTAL_DIRS.each do |dir|
            case dir
            when :up
                end_pos_array += grow_unblocked_moves_in_dir(-1,0)
            when :right
                end_pos_array += grow_unblocked_moves_in_dir(0,1)
            when :down
                end_pos_array += grow_unblocked_moves_in_dir(1,0)
            when :left
                end_pos_array += grow_unblocked_moves_in_dir(0,-1)
            end
        end
        end_pos_array
    end

    def diagonal_dirs
        end_pos_array = []
        DIAGONAL_DIRS.each do |dir|
            case dir
            when :up_right
                end_pos_array += grow_unblocked_moves_in_dir(-1,1)
            when :down_right
                end_pos_array += grow_unblocked_moves_in_dir(1,1)
            when :down_left
                end_pos_array += grow_unblocked_moves_in_dir(1,-1)
            when :up_left
                end_pos_array += grow_unblocked_moves_in_dir(-1,-1)
            end
        end
        end_pos_array
    end

    def grow_unblocked_moves_in_dir(dy, dx)
        starting_pos = self.pos
        pos_1, pos_2 = self.pos
        current_pos = [pos_1 + dy, pos_2 + dx]
        valid_positions = []
        until invalid_pos_step_back?(current_pos) || invalid_pos_stay?(current_pos)
            valid_positions << current_pos

            pos_1, pos_2 = current_pos
            current_pos = [pos_1 + dy, pos_2 + dx]
        end
        if invalid_pos_stay?(current_pos)
            valid_positions << current_pos
        end
        valid_positions
    end

    def invalid_pos_step_back?(pos)
        piece = @board[pos]
        if piece
            return true if piece.color == @color
        else
            return true
        end
        false
    end

    def invalid_pos_stay?(pos)
        piece = @board[pos]
        return false if piece.nil?
        return true if piece.color == ([:BLACK, :WHITE].reject{ |ele| ele == @color })[0]
        false
    end
end
