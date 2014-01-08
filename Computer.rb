

class Computer
	attr_reader :move, :board

	def initialize
		@move = -1
		
	end
	

	def random_move(board)
		choice = "O"
		while (choice != nil)
			num = rand(9)
			choice = board[num]
		end
		return num + 1
	end

	def check_for_two(value,board)
		possibilities = Array.new
		possibilities = [ [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6] ]
		for possible in possibilities
			counter = 0
			for i in (0...3)
				if (board[possible[i]] == value)
					counter = counter + 1
				end
			end

			if (counter == 2)
				for i in (0...3)
					if (board[possible[i]] == nil)
						return possible[i] + 1
					end
				end
			end
		end
		return -1
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


def middle(board)
	if (board[4] == nil)
		return 5
	else
		return -1
	end
end



def Turn(board)
	if (check_for_two('O',board) != -1)
		return check_for_two('O',board)
	elsif (check_for_two('X',board) != -1)
		return check_for_two('X',board)
	elsif (middle(board) != -1)
		return middle(board)
	elsif (random_corner(board) != -1)
		return random_corner(board)
	else
		return random_move(board)
	end
end

		
		


	






end