require_relative 'piece'
require_relative 'stepable'
class Pawn < Piece

    def initialize(color, board, pos)
        super(color, board, pos) 
    end

    def symbol
        case color 
        when 'black'
            return '♟' 
        when 'white' 
            return '♙'
        end
    end

    def moves
       forward_steps + side_attacks
    end

    private

    def at_start_row?
        case color
        when 'black'
            return true if @pos[0] == 1
        when 'white'
            return true if @pos[0] == 6
        else
            return false
        end
    end

    def forward_dir
        case @color
        when 'black'
            return 1
        when 'white'
            return -1
        end
    end

    def forward_steps
        if at_start_row?
            return [[@pos[0]+2, 0], [@pos[0]+1, 0]] if color == 'black' && @board.valid_pos?([@pos[0]+2, 0]) && @board.valid_pos?([@pos[0]+1, 0])
            return [[@pos[0]-2, 0], [@pos[0]-1, 0]] if color == 'white' && @board.valid_pos?([@pos[0]-2, 0]) && @board.valid_pos?([@pos[0]-1, 0])
        else
            return [[@pos[0]+1, 0]] if color == 'black' && @board.valid_pos?([@pos[0]+1, 0])
            return [[@pos[0]-1, 0]] if color == 'white' && @board.valid_pos?([@pos[0]-1, 0])
        end
        []
    end

    def side_attacks
        res = []
        n = forward_dir
        left = [1,-1].map {|ele| ele * n }
        right = [1,1].map {|ele| ele * n }

        new_pos_left = [@pos.first + left.first, @pos.last + left.last]
        new_pos_right = [@pos.first + right.first, @pos.last + right.last]

        res << new_pos_left if @board[new_pos_left].color != self.color && @board[new_pos_left] != nil
        res << new_pos_right if @board[new_pos_right].color != self.color && @board[new_pos_right] != nil

        res
    end

    
    
end