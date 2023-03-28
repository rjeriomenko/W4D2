require_relative 'piece'
require_relative 'slideable'

class Queen < Piece
    include Slideable

    def symbol
        return :Q
    end

    # def move_dirs # modulate behavior of move_dirs to modify usage of horizontal dirs and diagonal dirs

    # end

end
