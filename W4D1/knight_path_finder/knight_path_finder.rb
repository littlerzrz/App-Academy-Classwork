require_relative 'poly_tree_node.rb'
require 'byebug'
class KnightPathFinder
    DIRECTIONS = [[-2,-1], [-1,-2], [2,1], [2,-1], [1,2], [1,-2], [-2,1], [-1,2]]
    attr_reader :start_pos, :considered_positions

    def self.valid_moves(position)
       valid_moves = []
       DIRECTIONS.each do |direction|
            new_pos_0 = direction[0] + position[0]
            new_pos_1 = direction[1] + position[1]
        
        if new_pos_0.between?(0,7) &&  new_pos_1.between?(0,7)
            valid_moves << [new_pos_0, new_pos_1]
        end
       end
       valid_moves
    end

    def initialize(position)
        @start_pos = PolyTreeNode.new(position)
        @considered_positions = [position]
        self.build_move_tree
    end

    def new_move_positions(position)
        # debugger
        new_moves = KnightPathFinder.valid_moves(position)
        arr = []
        new_moves.each do |pos|
            if !@considered_positions.include?(pos)
                @considered_positions << pos 
                arr << pos
            end
        end
        arr
        # if !@considered_positions.include?(position) &&  KnightPathFinder.valid_moves(position).include?(position)
        # end
    end

    def build_move_tree
        # debugger
        queue = []

        queue << @start_pos

        until queue.empty?
            first = queue.shift

            next_moves = new_move_positions(first.value)

            next_moves.each do |pos|
                child_node = PolyTreeNode.new(pos)
                child_node.parent= first
                queue.push(child_node)
            end
        end
    
    end

    def find_path(end_pos)
        res = @start_pos.dfs(end_pos)
        trace_path_back(res)
    end

    def trace_path_back(node)
        arr = [node.value]
        level_up = node.parent
        
        until level_up == @start_pos
            arr.unshift(level_up.value)
            level_up = level_up.parent
        end
        arr.unshift(@start_pos.value)
    end

end
