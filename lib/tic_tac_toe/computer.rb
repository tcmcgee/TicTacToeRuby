module TicTacToe
  class Computer
    attr_reader :move, :board

    def initialize
      @move = -1
    end

    def turn(board)
      win = check_for_two('O',board)
      block = (check_for_two('X',board))
      if (win != -1)
        return win
      elsif (block != -1)
        return block
      else
        return random_move(board)
      end
    end
    def possible_wins(board)
      possible_wins = Array.new
      if board.length == 9
        possible_wins = [ [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6] ]
      elsif board.length == 16
        possible_wins = [[0, 1, 2, 3], [4, 5, 6, 7], [8, 9, 10, 11], [12, 13, 14, 15], [0, 4, 8, 12], [1, 5, 9, 13], [2, 6, 10, 14], [3, 7, 11, 15], [0, 5, 10, 15], [3, 6, 9, 12]]
      end
    end

    def check_for_two(value,board)
      row_length = Math.sqrt(board.length)
      possible_wins(board).each do |possible|
        counter = 0
        (0...row_length).each do |i|
          if (board[possible[i]] == value)
            counter = counter + 1
          end
        end
        if (counter == row_length-1)
          (0...row_length).each do |i|
            if (board[possible[i]] == nil)
              return possible[i] + 1
            end
          end
        end
      end
      return -1
    end

    def middle(board)
      if (board[4] == nil)
        return 5
      else
        return -1
      end
    end

    def random_corner(board)
      choice = "O"
      possible = Array.new
      possible = [1,3,7,9]

      while (choice != nil && possible.length != 0)
        num = rand(possible.length)
        choice = board[possible[num] - 1]
        if (choice == nil)
          return possible[num]
        else
          possible.delete_at(num)
        end
      end
      if (possible.length == 0)
        return -1
      end
    end

    def random_move(board)
      choice = "O"
      while (choice != nil)
        num = rand(board.length)
        choice = board[num]
      end
      return num + 1
    end
  end
end
