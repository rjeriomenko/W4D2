require_relative 'piece'
require_relative 'slideable'

class Rook < Piece
    include Slideable

    def symbol
        return :R
    end

    def move_dirs # modulate behavior of move_dirs to modify usage of horizontal dirs and diagonal dirs
        horizontal_dirs
    end

end


