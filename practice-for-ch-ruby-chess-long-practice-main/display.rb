require_relative "board.rb"
require_relative "cursor.rb"
require "colorize"

class Display
    attr_reader :cursor

    def initialize(board)
        @board = board
        @cursor = Cursor.new([0,0], board)
    end

    def render
        (0..7).each do |pos_1|
            (0..7).each do |pos_2|
                pos = [pos_1, pos_2]
                piece = @board[pos]

            
                unless pos_2 == 7
                    color = piece.color
                    color = :red if @cursor.cursor_pos == pos
                    if piece.symbol
                        print "#{piece.symbol} ".colorize(color)
                    elsif @cursor.cursor_pos == pos
                        print "◈ ".colorize(color)
                    else
                        print "  ".colorize(color)
                    end
                else
                    color = piece.color
                    color = :red if @cursor.cursor_pos == pos
                    if piece.symbol
                        print "#{piece.symbol}\n".colorize(color)
                    elsif @cursor.cursor_pos == pos
                        print "◈\n".colorize(color)
                    else
                        print " \n".colorize(color)
                    end
                end
            end
        end
    end


end