require_relative "./null_piece.rb"

class Board
    def initialize
        @rows = Array.new(8) {Array.new(8)}
        @null_piece = NullPiece.instance
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
                @rows[pos_1][pos_2] = Piece.new
            end
        end

        (6..7).each do |pos_1|
            (0..7).each do |pos_2|
                @rows[pos_1][pos_2] = Piece.new
            end
        end
    end

    def board_print
        @rows.each do |row|
            row.each_with_index do |piece, i|
                unless i == row.length - 1
                    if piece.type == "piece"
                        print "#{:P} "
                    else
                        print "#{:N} "
                    end
                else
                    if piece.type == "piece"
                        print "#{:P}\n"
                    else
                        print "#{:N}\n"
                    end
                end
            end
        end
    end


end
