class Recursive_computer
	#1,9,8,3,6
	def initialize
    @depth = 0
  end

  def Turn(board)
    @@possible = possible_wins(board)
    if (num_available_moves(board) > 11)
      return random_move(board)
    end
    current_turn = false
    move =  negamax(board, current_turn, 0, {}).to_i + 1
    return move
  end

  private

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

  def negamax(board,turn,depth,best)
    move_char = (turn ? 'X' : 'O')
    if (get_winner(board,turn,@@possible) != nil)
      return -10
    elsif num_available_moves(board) == 0
      return 0
    end
    (0...board.length).each do |i|

      if (board[i] != nil)
        # no op
      else  

        new_board = Array.new(board.length,nil)
        (0...board.length).each do |j|
          new_board[j] = board[j]
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

  def get_winner(board,turn,wins = possible_wins(board))
    per_row = Math.sqrt(board.length)
    wins.each do |possible|
      counter = 0 
      (0...per_row).each do |index|
        if (board[possible[index]] == board[possible[0]] && board[possible[0]] != nil)
          counter = counter + 1
        end
      end
      if (counter == per_row)
        return (turn ? 'X' : 'O')
      end
    end
    return nil
  end

  def possible_wins(board)
    per_row = Math.sqrt(board.length)
    possible = []
    (0...board.length).each do |i|
      possible.push(i)
    end
    vertical = []
    possible = possible.each_slice(per_row).to_a
    (0...per_row).each do |row|
      vertical = []
      (0...per_row).each do |index|
        row_array = possible[index]
        vertical.push(row_array[row])
      end
      possible.push(vertical)
    end
    diag = []
    if ((board.length % 2) == 1)
      diag = []
      row = 0
      (0...per_row).each do |column|
        row_array = possible[column]
        diag.push(row_array[row])
        row = row + 1
      end
      possible.push(diag)
      diag = []
      row = per_row - 1
      (0...per_row).each do |column|
        row_array = possible[column]
        diag.push(row_array[row])
        row = row - 1
      end
      possible.push(diag)
    end
    return possible
  end

end
