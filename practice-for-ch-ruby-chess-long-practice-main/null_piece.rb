require_relative "./piece.rb"
require 'singleton'

class NullPiece < Piece
    include Singleton

    private
    def initialize
        @type = nil
    end
end
