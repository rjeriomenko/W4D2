require_relative 'piece'
require_relative 'stepable'

class Knight < Piece
    include Stepable

    def symbol
        return :N
    end

    def move_diffs
        start_1, start_2 = pos
        possible_positions = []
        (start_1-2..start_1+2).each do |pos_1|
            (start_2-2..start_2+2).each do |pos_2|
                current_pos = [pos_1, pos_2]
                if [1,-1,3,-3].include?((pos_1 - start_1) + (pos_2 - start_2))
                    if ((pos_1 - start_1) * (pos_2 - start_2)) != 0
                        possible_positions << current_pos
                    end
                end
            end
        end
        return possible_positions
    end

end
