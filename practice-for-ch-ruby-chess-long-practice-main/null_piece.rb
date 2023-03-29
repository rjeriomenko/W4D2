require_relative "./piece.rb"
require 'singleton'

class NullPiece < Piece
    include Singleton

    def symbol
        return nil
    end

    private
    def initialize
        @type = nil
    end
   

end
