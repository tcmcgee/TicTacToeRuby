
class TicTacToe
	attr_reader :board

	def initialize(size)
		@board  = Array.new(size,nil)
		@turn   = true
		@size = size
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
		@board.each do |tile|
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

	def get_horizontal_wins
		board_length = @board.length
		per_row = Math.sqrt(board_length)
		possible = []
		(0...board_length).each do |i|
			possible.push(i)
		end

		possible = possible.each_slice(per_row).to_a
	end

	def get_vertical_wins(horizontal)
		vertical = []
		possible = []
		board_length = @board.length
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

	def get_diagonal_wins(possible)
		board_length = @board.length
		per_row = Math.sqrt(board_length)
		diag = []
		if ((board_length % 2) == 1)
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
	end

	def possible_wins
		possible = get_horizontal_wins
		possible = possible + get_vertical_wins(possible)
		possible = possible + get_diagonal_wins(possible)
		return possible
	end

	def get_winner
		wins = possible_wins
		per_row = Math.sqrt(@board.length)
		wins.each do |possible|
			counter = 0
			(0...per_row).each do |index|
				if (@board[possible[index]] == @board[possible[0]] && @board[possible[0]] != nil)
					counter = counter + 1
				end
			end
			if (counter == per_row)
				return (@turn ? 'X' : 'O')
			end
		end
		return nil
	end

	def victory?
		!!get_winner
	end

	def reset
		(0...size).each do |i|
			@board[i] = nil
		end
	end

	def over
		victory? || tie?
	end

end
