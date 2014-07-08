
class TicTacToe
	attr_reader :board

	def initialize(size = 3)
		print size
		@board  = Array.new(size)
		@turn   = true
		@size = size
	end

	def populate_empty_board
		print @size
		(0 ... @size).each do |i|
			@board[i] = nil
		end
	end

	def size 
		@size
	end

	def set_board(new_board)
		(0...@size).each do |i|
			@board[i] = new_board[i]
		end
	end

	def move(index, turn)
		@board[index - 1] = (turn ? "X" : "O")
	end

	def tie?
		count = 0
		for tile in @board
			if (!tile.eql?(nil))
				count = count + 1
			end
		end

		if (victory? == false)
			if(count == size)
				return true
			else
				return false
			end
		else
			return false
		end

	end

	def get_board
		return @board
	end

	def tie?
		return false if victory?
		@board.compact.size == size
	end

	def get_winner
		
		if size == 9
			possibilities = [ [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6] ]
		elsif size == 16
			possibilities = [[0, 1, 2, 3], [4, 5, 6, 7], [8, 9, 10, 11], [12, 13, 14, 15], [0, 4, 8, 12], [1, 5, 9, 13], [2, 6, 10, 14], [3, 7, 11, 15], [0, 5, 10, 15], [3, 6, 9, 12]]
		end

		for possible in possibilities
			if size == 9
				if (@board[possible[0]].eql?(@board[possible[1]]) && @board[possible[0]].eql?(@board[possible[2]]) && @board[possible[0]] != nil  )
					return (@turn ? 'X' : 'O')
				end
			else
				if (@board[possible[0]].eql?(@board[possible[1]]) && @board[possible[0]].eql?(@board[possible[2]]) && @board[possible[0]].eql?(@board[possible[3]]) && @board[possible[0]] != nil  )
					return (@turn ? 'X' : 'O')
				end
			end
		end
		return nil
	end

	def victory?
		!!get_winner
	end

	def reset
		for i in (0...size)
			@board[i] = nil
		end
	end

	def over
		victory? || tie?
	end

end
