require_relative 'piece'
require_relative 'stepable'
class King < Piece
    include Stepable


    def initialize(color, board, pos)
        super(color, board, pos) 
    end

    def symbol
        case color 
        when 'black'
            return "♚"
        when 'white' 
            return "♔"
        end
        
    end

    def move_diffs
        [[0, 1], [0, -1], [1, 0], [-1, 0], [1, 1], [-1,-1], [-1,1], [1,-1]]
    end
    
end