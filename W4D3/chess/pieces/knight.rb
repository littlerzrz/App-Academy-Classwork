require_relative 'piece'
require_relative 'stepable'

class Knight < Piece
    include Stepable

    def initialize(color, board, pos)
        super(color, board, pos) 
    end

    def symbol
        case color 
        when 'black'
            return "♞"
        when 'white' 
            return "♘"
        end
    end


    def move_diffs
        [[2, 1], [2, -1], [-2, 1], [-2, -1], [1, 2], [1, -2], [-1, 2], [-1, -2]]
    end
    
end