class Board
     def initialize
        @piles = Array.new(3){Array.new}
        disc1 = Disc.new(1)
        @piles[0].push(disc1,disc2,disc3)
     end
end