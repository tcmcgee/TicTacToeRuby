module TicTacToe
  class Computer
    attr_reader :move
    attr_accessor :board

    def initialize
      @move = -1
      @board = Array.new(9,nil)
    end

    def turn(board)
      @board = board
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

 def possible_wins 
      possible_wins = Array.new
      possible_wins.push(*get_horizontal_wins)
      possible_wins.push(*get_vertical_wins)
      possible_wins.push(*get_diagonal_wins)
      possible_wins
    end

    def get_row_length
      Math.sqrt(board.length)
    end

    def get_horizontal_wins
      row_length = get_row_length
      horizontal_wins = Array.new
      count = 0
      (0...row_length).each do |row|
        win = Array.new(row_length)
        (0...row_length).each do |col|
          win[col] = count
          count += 1
        end
        horizontal_wins.push(win)
      end
      horizontal_wins
    end

    def get_vertical_wins
      row_length = get_row_length
      vertical_wins = Array.new
      count = 0
      (0...row_length).each do |row|
        win = Array.new(row_length)
        count = row
        (0...row_length).each do |col|
          win[col] = count
          count += row_length
        end
        vertical_wins[row] = win
      end
      vertical_wins
    end

    def get_diagonal_wins
      row_length = get_row_length
      left_diag = Array.new
      right_diag = Array.new
      left = 0
      right = row_length - 1
      (0...row_length).each do |row|
        left_diag.push(left)
        right_diag.push(right)
        left += row_length + 1
        right += row_length - 1
      end
      [left_diag, right_diag]
    end

    def check_for_two(value,board)
      row_length = Math.sqrt(board.length)
      possible_wins.each do |possible|
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
