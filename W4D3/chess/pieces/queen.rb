require_relative 'piece'
require_relative 'slideable'
class Queen < Piece
    include Slideable

    def initialize(color, board, pos)
        super(color, board, pos) 
    end

    def symbol
        case color 
        when 'black'
            return '♛' 
        when 'white' 
            return '♕'
        end
    end

    def move_dirs
        horizontal_dirs + diagonal_dirs
    end
    
end