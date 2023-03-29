require_relative "display"

class Game
    def initialize
        @board = Board.new
        @display = Display.new(@board)
    end

    def play
        loop do
            system("clear")
            @display.render
            @display.cursor.get_input
        end
    end


end

