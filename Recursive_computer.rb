class Recursive_computer
	#1,9,8,3,6
	def initialize
    @depth = 0
  end

  def Turn(board)
    if (num_available_moves(board) > 11)
      return random_move(board)
    elsif (num_available_moves(board) > 8)
      print "Thinking... Please Wait!"
    end
    
    current_turn = false
    move =  negamax(board, current_turn, 0, {}).to_i + 1
    return move
  end

  private

  def random_move(board)
    random = rand(board.length)
    while (board[random] != nil)
      #print "stuck"
      random = rand(board.length)
    end
    return random
  end

  def num_available_moves(board)
    board.size - board.compact.size
  end

  def negamax(board,turn,depth,best)
    move_char = (turn ? 'X' : 'O')
    if (computer_victory(board) || player_victory(board))
      print board
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

  def player_victory(board)
    possible_wins(board).each do |possible|
      counter = 0
      (0...(Math.sqrt(board.length).round)).each do |i|
        if (board[possible[0]]).eql?(board[possible[i]] && board[possible[0]] == 'X' && board[possible[0]] != nil)
          counter += 1
        end
        if (counter == (Math.sqrt(board.length).round))
          #return true
        end
      end
    end
    return false
  end

  def computer_victory(board)
  	possible_wins(board).each do |possible|
      counter = 0
      (0... possible.length).each do |i|
        if (board[possible[0]]).eql?(board[possible[i]] && board[possible[0]].eql?('O') && board[possible[0]] != nil)
          counter += 1
        end
        if (counter.equal?(possible.length))
          print i
          return true
        end
      end
    end
    return false
  end

def possible_wins(board)
 possible_wins = Array.new
 if board.length == 9
  possible_wins = [ [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6] ]
elsif board.length == 16
  possible_wins = [[0, 1, 2, 3], [4, 5, 6, 7], [8, 9, 10, 11], [12, 13, 14, 15], [0, 4, 8, 12], [1, 5, 9, 13], [2, 6, 10, 14], [3, 7, 11, 15], [0, 5, 10, 15], [3, 6, 9, 12]]
end
end

end