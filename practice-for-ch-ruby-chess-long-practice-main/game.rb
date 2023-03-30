require_relative "display"
require_relative "player"

class Game
    def initialize(player_1_name, player_2_name)
        @board = Board.new
        @display = Display.new(@board)
        @player_1 = Player.new(player_1_name, :white)
        @player_2 = Player.new(player_2_name, :black)
        @current_player = @player_1
    end

    def play
        until game_over?
            system("clear")
            player_in_check = @board.in_check?(@current_player.color)
            puts turn_message = "It's #{@current_player.name.capitalize} -- #{@current_player.color.to_s.capitalize}'s turn\n\n"
            puts check_message = "Your king is in check\n\n" if player_in_check
            @display.render
            until cursor_pos = @display.cursor.get_input
                system("clear")
                puts turn_message
                puts check_message = "Your king is in check\n\n" if player_in_check
                @display.render
            end

            piece = @board[cursor_pos]
            if piece.color != @current_player.color
                puts "You chose the wrong color piece. You are #{@current_player.color.to_s.capitalize}\n\n"
                sleep(2)
            else
                system("clear")
                puts select_message = "You have selected the #{piece.color.to_s.capitalize} #{piece.symbol.to_s.capitalize} at #{piece.pos}\n\n"
                puts check_message if player_in_check
                @display.render
                until end_pos = @display.cursor.get_input
                    system("clear")
                    puts select_message
                    puts check_message = "Your king is in check\n\n" if player_in_check
                    @display.render
                end

                if !piece.moves.include?(end_pos)
                    puts "You cannot move that piece to #{end_pos}\n\n"
                    sleep(2)
                elsif piece.move_into_check?(end_pos)
                    puts "That move would leave your king in check\n\n"
                    sleep(2)
                else
                    @board.move_piece(piece.pos, end_pos)
                    switch_players
                end
            end
        end
        system("clear")
        puts "Black has won!" if @board.checkmate?(:white)
        puts "White has won!" if @board.checkmate?(:black)
        @display.render
    end

    def game_over?
        @board.checkmate?(:white) || @board.checkmate?(:black)
    end

    def switch_players
        @current_player = ([@player_1, @player_2].reject { |ele| ele == @current_player })[0]
    end


end