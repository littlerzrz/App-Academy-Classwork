class Piece
    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def to_s
        " #{self.symbol} "
    end

    def empty?
        false
    end

    def valid_moves

    end

    def pos=(val)
        @pos = val
    end

    def symbol
        raise "each individual class need to implement this!!!!!!!"
    end

    private
    def move_into_check?(end_pos)
    end
    
end

