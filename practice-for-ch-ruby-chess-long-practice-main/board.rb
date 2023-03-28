require_relative "./null_piece.rb"

class Board
    def initialize
        @rows = Array.new(8) {Array.new(8)}
        @null_piece = NullPiece.instance #NEEDS TO BE PRIVATE
        populate_null_pieces
        populate_pieces
    end

    def populate_null_pieces
        (2..5).each do |pos_1|
            (0..7).each do |pos_2|
                @rows[pos_1][pos_2] = @null_piece
            end
        end
    end

    def populate_pieces # incorporate Board#add_piece later
        (0..1).each do |pos_1|
            (0..7).each do |pos_2|
                @rows[pos_1][pos_2] = Piece.new(:W, self, [pos_1, pos_2])
            end
        end

        (6..7).each do |pos_1|
            (0..7).each do |pos_2|
                @rows[pos_1][pos_2] = Piece.new(:B, self, [pos_1, pos_2])
            end
        end
    end

    def move_piece(start_pos, end_pos) #assuming start and end pos are valid
        if self[start_pos] == @null_piece
            raise RuntimeError.new "No piece at start position."
        elsif self[start_pos].color == self[end_pos].color
            raise RuntimeError.new "Same color piece at end position"
        end

        self[end_pos] = self[start_pos]
        self[end_pos].pos = end_pos
        self[start_pos] = @null_piece
    end



    # render
    def board_print
        @rows.each do |row|
            row.each_with_index do |piece, i|
                unless i == row.length - 1
                    print "#{piece.symbol} "
                else
                    print "#{piece.symbol}\n"
                end
            end
        end
    end


    private

    def [](position) #public in UML. WHY?
        pos_1, pos_2 = position
        @rows[pos_1][pos_2]
    end

    def []=(position, piece) #public in UML. WHY?
        pos_1, pos_2 = position
        @rows[pos_1][pos_2] = piece
    end

end
