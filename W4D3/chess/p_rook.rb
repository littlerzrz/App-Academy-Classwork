require_relative 'piece'
require_relative 'slideable'
class Rook < Piece
    include Slideable
    attr_reader :symbol

    def initialize(color, board, pos)
        super
    end

    def symbol
        case color 
        when 'black'
            return '♜' 
        when 'white' 
            return '♖'
        end
    end
    
    def move_dirs
        horizontal_dirs
    end
    
end