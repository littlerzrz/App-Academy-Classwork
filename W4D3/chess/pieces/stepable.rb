module Stepable

    def moves
        res = []
        move_diffs.each do |diff|
            new_pos = [@pos.first + diff.first, @pos.last + diff.last]
            res << new_pos if @board.valid_pos?(new_pos)
        end
        res 
    end

    def move_diffs
        raise "write your move_diffs method!"
    end

end


