require_relative "piece"

class Board
    def initialize
        @grid = Array.new(8) { Array.new(8) }
        place_init_pieces
    end
    def place_init_pieces
        (0..1).each do |i|
            (0..7).each do |j|
                @grid[i][j] = Piece.new
            end
        end
        (6..7).each do |i|
            (0..7).each do |j|
                @grid[i][j] = Piece.new
            end
        end
    end
    
    def [](pos)
        @grid[pos.first][pos.last]
    end

    def []=(pos, piece)
        @grid[pos.first][pos.last] = piece
    end

    def move_piece(start_pos, end_pos)

        raise "Invalid Move" if self[start_pos] == nil || self[end_pos] != nil
            
        self[end_pos],self[start_pos] = self[start_pos],self[end_pos]
        p @grid
    end

    def valid_pos?(pos)
        return false if !pos.first.between?(0,7) || !pos.last.between?(0,7) || !@board[pos.first][pos.last].nil?
        true
    end

    # private
    attr_reader :grid
end

a = Board.new
a.move_piece([0, 1], [1, 1])
# pos = [1,1]
# p a[pos]
# p a[pos] = 2