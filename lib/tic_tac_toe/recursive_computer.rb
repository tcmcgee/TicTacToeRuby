require 'tic_tac_toe/board'

module TicTacToe
  class Recursive_computer
    #1,9,8,3,6
    def initialize
      @depth = 0
    end

    def turn(board)
      if (num_available_moves(board) > 11)
        return random_move(board)
      end
      current_turn = false
      move =  negamax(board, current_turn, 0, {}).to_i + 1
      return move
    end

    def random_move(board)
      random = rand(board.length)
      while (board[random] != nil)
        random = rand(board.length)
      end
      return random
    end

    def num_available_moves(board)
      board.size - board.compact.size
    end

    def negamax(tiles,turn,depth,best)
      move_char = (turn ? 'X' : 'O')
      board = TicTacToe::Board.new(tiles.length)
      board.set_tiles(tiles)
      if (board.get_winner != nil)
        return -10
      elsif num_available_moves(board.tiles) == 0
        return 0
      end
      (0...board.tiles.length).each do |i|

        if (board.tiles[i] != nil)
          # no op
        else

          new_board = Array.new(board.tiles.length,nil)
          (0...board.tiles.length).each do |j|
            new_board[j] = board.tiles[j]
          end
          new_board[i] = move_char
          best[(i).to_s] = -1 * negamax(new_board, !turn, depth + 1,{}).to_i
        end
      end
      move = best.max_by { |key,value| value }[0]
      high_score = best.max_by { |key, value| value }[1]
      if  depth == 0
        return move
      else
        return high_score
      end
    end

  end
end
