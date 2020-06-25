require_relative "piece"

class NullPiece < Piece
    include Singleton

    def initialize
    end

    def color
    end

    def symbol
        " "
    end

    def empty?
        true
    end

    def moves
        raise "Can't move!"
    end

end