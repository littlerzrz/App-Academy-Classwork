require_relative "piece.rb"
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
        if grid[end_pos].is_a?(NullPiece)
            
        raise
        end 
    end

    # private
    attr_reader :grid
end

# a = Board.new
# pos = [1,1]
# p a[pos]
# p a[pos] = 2