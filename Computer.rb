

class Computer
	attr_reader :move, :board

	def initialize
		@move = -1
		
	end

	def Turn(board)
		win = check_for_two('O',board)
		block = (check_for_two('X',board))
		mid = middle(board)
		corner = random_corner(board)
		if (win != -1)
			return win
		elsif (block != -1)
			return block
		elsif (mid != -1)
			return mid
		elsif (corner != -1)
			return corner
		else
			return random_move(board)
		end
	end





	def check_for_two(value,board)
		possibilities = Array.new
		possibilities = [ [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6] ]
		possibilities.each do |possible| 
			counter = 0
			(0...3).each do |i|
				if (board[possible[i]] == value)
					counter = counter + 1
				end
			end

			if (counter == 2)
				(0...3).each do |i|
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
			num = rand(9)
			choice = board[num]
		end
		return num + 1
	end


end
