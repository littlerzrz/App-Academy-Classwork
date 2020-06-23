require_relative 'tic_tac_toe'
require 'byebug'
class TicTacToeNode
  attr_reader :board, :next_mover_mark, :children, :prev_move_pos
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
    @children = []

  end

  def losing_node?(evaluator)
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    # debugger
    empty_pos = []

    (0...3).each do |i|
      (0...3).each do |j|
        empty_pos << [i,j] if @board.empty?([i,j]) 
      end
    end

    empty_pos.each do |pos|
      new_board = @board.dup
      mark = ((@next_mover_mark == :x) ? :o : :x)
      new_board[pos] = mark
      @children << TicTacToeNode.new(new_board,mark,pos)
    end

    @next_mover_mark = ((@next_mover_mark == :x) ? :o : :x)
    
    @children
  end

  def losing_node?
    return true if @board.over? && @board.winner == self.next_mover_mark
    return false if @board.over? && (@board.winner != self.next_mover_mark || @board.winner.nil?)

  end

end


