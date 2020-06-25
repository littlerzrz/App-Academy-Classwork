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
        case color
        when 'black'
            return 1
        when 'white'
            return -1
        end

        # color == :white ? 1 : -1
    end

    def forward_steps
        res = []
        two_step = [2,0].map {|ele| ele * forward_dir}
        one_step = [1,0].map {|ele| ele * forward_dir}

        new_two = [@pos.first + two_step.first, @pos.last + two_step.last]
        new_one = [@pos.first + one_step.first, @pos.last + one_step.last]

        if at_start_row?
            res.push(new_two, new_one) 
        else
            res << new_one if @board[new_one].empty?
        end
        
        res
    end

    def side_attacks
        res = []
        left = [1,-1].map {|ele| ele * forward_dir }
        right = [1,1].map {|ele| ele * forward_dir }

        new_pos_left = [@pos.first + left.first, @pos.last + left.last]
        new_pos_right = [@pos.first + right.first, @pos.last + right.last]

        res << new_pos_left if @board[new_pos_left].color != self.color && !@board[new_pos_left].empty?
        res << new_pos_right if @board[new_pos_right].color != self.color && !@board[new_pos_right].empty?

        res
    end

    
    
end