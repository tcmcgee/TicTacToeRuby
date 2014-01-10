

class TicTacToe 
attr_reader :board
	
	
	def initialize
		@board = Array.new
		for i in (0...9)
			@board[i] =  nil
		end
		@turn = true
		@over = false
		@winner = ""
	end

	def set_board(new_board)
		for i in (0...9)
			@board[i] = new_board[i]
		end
	end



	def move(index, turn)
		if (turn)
			@board[index - 1] = "X"
		else
			@board[index-1] = "O"
		end
		
	end

	def victory?
		possibilities = Array.new
		possibilities = [ [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6] ]
		for possible in possibilities
			if ((@board[possible[0]].eql?(@board[possible[1]])) && (@board[possible[0]].eql?(@board[possible[2]])) && @board[possible[0]] != nil  )
				if (!@turn)
					@winner = 'O'
				elsif (@turn)
					@winner = 'X'
				end
				@over = true
				return true
			end
		end
		return false
	end

	def tie?
		count = 0
		for tile in @board
			if (!tile.eql?(nil))
				count = count + 1
			end
		end
		if (victory? == false)
			if(count == 9)
				@over = true
				@winner = 'T'
				return true
			else
				return false
			end

		else
			return false
		end
	end



	def reset
		for i in (0...9)
			@board[i] = nil
		end
		@winner = ""
	end

	def over
		if (victory? || tie?)
			return true
		end

	end

	def get_winner
		return @winner
	end

end

		
