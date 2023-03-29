require_relative "./null_piece.rb"
require_relative "queen.rb"
require_relative "rook.rb"
require_relative "bishop.rb"
require_relative "knight.rb"
require_relative "king.rb"
require_relative "pawn.rb"

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

    def populate_pieces
        piece_hash = Hash.new { |h,k| h[k] = Array.new }
        piece_hash[:R] = [0, 7]
        piece_hash[:N] = [1, 6]
        piece_hash[:B] = [2, 5]
        piece_hash[:K] = [3]
        piece_hash[:Q] = [4]

        piece_hash.each do |key, value|
            case key
            when :R 
                add_piece(Rook.new(:white, self, [0, value[0]]), [0, value[0]])
                add_piece(Rook.new(:white, self, [0, value[1]]), [0, value[1]])
                add_piece(Rook.new(:black, self, [7, value[0]]), [7, value[0]])
                add_piece(Rook.new(:black, self, [7, value[1]]), [7, value[1]])
            when :N
                add_piece(Knight.new(:white, self, [0, value[0]]), [0, value[0]])
                add_piece(Knight.new(:white, self, [0, value[1]]), [0, value[1]])
                add_piece(Knight.new(:black, self, [7, value[0]]), [7, value[0]])
                add_piece(Knight.new(:black, self, [7, value[1]]), [7, value[1]])
            when :B
                add_piece(Bishop.new(:white, self, [0, value[0]]), [0, value[0]])
                add_piece(Bishop.new(:white, self, [0, value[1]]), [0, value[1]])
                add_piece(Bishop.new(:black, self, [7, value[0]]), [7, value[0]])
                add_piece(Bishop.new(:black, self, [7, value[1]]), [7, value[1]])
            when :K
                add_piece(King.new(:white, self, [0, value[0]]), [0, value[0]])
                add_piece(King.new(:black, self, [7, value[0]]), [7, value[0]])
            when :Q
                add_piece(Queen.new(:white, self, [0, value[0]]), [0, value[0]])
                add_piece(Queen.new(:black, self, [7, value[0]]), [7, value[0]])
            end
        end

        (0..7).each do |i|
            add_piece(Pawn.new(:white, self, [1, i]), [1, i])
            add_piece(Pawn.new(:black, self, [6, i]), [6, i])
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
