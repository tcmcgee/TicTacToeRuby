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
    def get_horizontal_wins(board_length = @tiles.length)
    per_row = Math.sqrt(board_length)
    possible = []
    (0...board_length).each do |i|
      possible.push(i)
    end
    possible = possible.each_slice(per_row).to_a
  end

  def get_vertical_wins(horizontal,board_length = @tiles.length)
    vertical = []
    possible = []
    per_row = Math.sqrt(board_length)
    (0...per_row).each do |row|
      vertical = []
      (0...per_row).each do |index|
        row_array = horizontal[index]
        vertical.push(row_array[row])
      end
      possible.push(vertical)
    end
    return possible
  end

  def get_diagonal_wins
    per_row = Math.sqrt(@tiles.length).to_i

    left_diagonal_wins = (0...per_row).reduce([]) {
      |wins, num| wins.push(4 * num)
    }
    right_diagonal_wins = (1...(per_row + 1)).reduce([]) { |wins, num| wins.push(num + num) }

    [].push(left_diagonal_wins, right_diagonal_wins)
  end

  def possible_wins(board)
    board_length = board.tiles.length
    possible = get_horizontal_wins(board_length)
    possible = possible + get_vertical_wins(possible,board_length)
    possible = possible.to_a + get_diagonal_wins
    return possible
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
