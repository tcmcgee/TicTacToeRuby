class Computer
	attr_reader :board

	def Turn(board)
		check_for_two('O',board) ||
		check_for_two('X',board) ||
		middle(board)            ||
		random_corner(board)     ||
    random_move(board)
	end

	def check_for_two(value,board)
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
		return nil
	end

	def middle(board)
		if (board[4] == nil)
			return 5
		else
			return nil
		end
	end

	def random_corner(board)
    choice = "O"
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
			return nil
		end
	end

  def random_move(board)
    board.each
         .with_index(1)
         .reject { |value, index| value }
         .map(&:last)
         .sample
  end
end
