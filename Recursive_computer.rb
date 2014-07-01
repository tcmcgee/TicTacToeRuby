class Recursive_computer
	#1,9,8,3,6
	def initialize
    @depth = 0

	end

  # rename Turn -> turn
  # prefer to take a tic_tac_toe than a board
  # because the tic_tac_toe can provide abstractions around the things we calculate
   def Turn(board)

    if (num_available_moves(board) > 11)
      return random_move(board)
    elsif (num_available_moves(board) > 8)
      print "Thinking... Please Wait!"
    end
      
    current_turn = false
    move =  negamax(board, current_turn, 0, {}, (Float::INFINITY * -1),Float::INFINITY,1,board.length - num_available_moves(board)).to_i + 1
    return move
  end

  private

  def random_move(board)
    random = rand(board.length)
    while (board[random] != nil)
        print "stuck"
        random = rand(board.length)
    end
    return random
  end


  def num_available_moves(board)
    board.size - board.compact.size
  end

  def negamax(board,turn,depth,best,a,b,child_num,start_level)
    move_char = (turn ? 'X' : 'O')
    if (computer_victory(board) || player_victory(board))
      return -10 * (board.size + 1 - depth)
    elsif num_available_moves(board) == 0
      return 0
    end


    old_child_num = child_num
    child_num = 0
    beta = b
    (0...board.length).each do |i|

      if (board[i] != nil)
        # no op
      else  
        child_num += 1  
        new_board = Array.new(board.length,nil)
        (0...board.length).each do |j|
          new_board[j] = board[j]
        end
        new_board[i] = move_char
        
        score = -1 * negamax(new_board, !turn, depth + 1,{},-beta,-a,child_num,start_level).to_i
        if (a < score && score < b && old_child_num != 1)
          score = -1 * negamax(new_board, !turn, depth + 1,{},-b,-a,child_num,start_level).to_i
        end
        a = [score,a].max
        b = a + 1
        best[(i).to_s] = a
        if a >= b
          break
        end
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
  	for possible in possible_wins(board)
      if board.length == 9
  		  if ((board[possible[0]].eql?(board[possible[1]])) && (board[possible[0]].eql?(board[possible[2]])) && board[possible[0]] != nil && board[possible[0]] == 'X' )
  			 return true
        end
      else
        if (board[possible[0]].eql?(board[possible[1]]) && board[possible[0]].eql?(board[possible[2]]) && board[possible[0]].eql?(board[possible[3]]) && board[possible[0]] != nil && board[possible[0]] = 'X')
  	     return true
        end
      end
    end
  	return false
  end

  def computer_victory(board)
  	for possible in possible_wins(board)
      if board.length == 9
  	   if ((board[possible[0]].eql?(board[possible[1]])) && (board[possible[0]].eql?(board[possible[2]])) && board[possible[0]] != nil && board[possible[0]] == 'O' )
         return true
       end
      else
        if (board[possible[0]].eql?(board[possible[1]]) && board[possible[0]].eql?(board[possible[2]]) && board[possible[0]].eql?(board[possible[3]]) && board[possible[0]] != nil && board[possible[0]] == 'O')
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