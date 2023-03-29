require_relative "./null_piece.rb"
require_relative "queen.rb"
require_relative "rook.rb"
require_relative "bishop.rb"
require_relative "knight.rb"
require_relative "king.rb"

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
                @rows[pos_1][pos_2] = Piece.new(:white, self, [pos_1, pos_2])
            end
        end

        (6..7).each do |pos_1|
            (0..7).each do |pos_2|
                @rows[pos_1][pos_2] = Piece.new(:black, self, [pos_1, pos_2])
            end
        end
    end

    def add_piece(piece, pos)
        self[pos] = piece
        piece.pos = pos
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

    def [](position)
        pos_1, pos_2 = position
        return nil if pos_1 < 0 || pos_2 < 0
        @rows[pos_1][pos_2]
    end


    private


    def []=(position, piece) #public in UML. WHY?
        pos_1, pos_2 = position
        @rows[pos_1][pos_2] = piece
    end

end
