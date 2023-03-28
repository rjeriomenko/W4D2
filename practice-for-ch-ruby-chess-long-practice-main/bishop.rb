require_relative 'piece'
require_relative 'slideable'

class Bishop < Piece
    include Slideable

    def symbol
        return :B
    end

    def move_dirs # modulate behavior of move_dirs to modify usage of horizontal dirs and diagonal dirs
        diagonal_dirs
    end

end


