class MiniMaxComputer
	#IMPORTANT NOTE: Very contrary to class name does not actually use Minimax algorithim 



	def initialize
		@possible = [0,0,0,0,0,0,0,0,0]


		@lowest = 1000000000

		@lowest_index = -1
	end


	def tree(board,level,turn,turn_level)
		
		if (turn == false)
			move_char = 'O'
		else
			move_char = 'X'
		end
		if board[9] != nil
			index = board[9]

			if  (player_victory(board))

				@possible[index] = @possible[index] + (1 * ( level * 100 + turn_level))
			
			end

		end

		for i in (0...9)
			if (board[i] != nil)

			elsif (player_victory(board) || computer_victory(board) || level == 0)


			else
				#The 10th element in the array is the first move made, that way when the board is finished it can add or subtract to the proper index in @possible 
				new_board = Array.new(10,nil)
				if board.length == 9
					for j in (0...9)
						new_board[j] = board[j]
						if board[j] != nil
							@possible[j] = @possible[j] + 1000000
					

					
						
 						end
							
						
					end
					
					new_board[9] = i
				else
					
					for j in (0...10)
						new_board[j] = board[j]

					end
				end
				new_board[i] = move_char



				tree(new_board,level - 1, !turn,turn_level)
			end
		end


	end



	def Turn(board)
		level = 0
		for i in (0...9)
			if board[i] == nil
				level = level + 1
			end
		end
		tree(board,level,false,level)
		best_computer(board)
		
		print @possible
		reset
		if (special_cases(board,level) != -1)
			return special_cases(board,level)
		end

		
		
		return @lowest_index + 1
		


		
	end

	def urgent_move(board)

				for i in (0...9) 
			if (board[i] == nil)
				board[i] = 'O'
				if (computer_victory(board) == true)
					board[i] = nil
					return (i + 1)
				else
					board[i] = nil
				end
			end
		end
		for i in (0...9) 
			if (board[i] == nil)
				board[i] = 'X'
				if (player_victory(board) == true)
					board[i] = nil
					return (i + 1)
				else
					board[i] = nil
				end
			end
		end
		return -1

	end

	def prevent_corners(board,level)

		corners = 0
		if board[0] != nil
			corners = corners + 1 
		end
		if board[2] != nil
			corners = corners + 1 
		end
		if board[6] != nil
			corners = corners + 1 
		end
		if board[8] != nil 
			corners = corners + 1
		end

		if corners == 2 && level == 6 && board[4] == 'O'
			if (board[3] == nil)
				return 4
			elsif board[5] == nil
				return 6
			elsif board[1] == nil
				return 2
			elsif board[7] == nil 
				return 8
			end
		end
		return -1
	end


	def special_cases(board,level)

		urgent = urgent_move(board)
		corners = prevent_corners(board,level)

		if (urgent!= -1 )
			return urgent
		elsif (corners != -1)
			return corners
		else
			return -1
		end
		 
	end

	def reset		
		@lowest = Float::INFINITY
		@possible = [0,0,0,0,0,0,0,0,0]


	end




	def best_computer(board)

		for i in (0...9) do
			if (@possible[i] < @lowest)
				@lowest =  @possible[i] 
				@lowest_index = i


			end

		end
	end


		
	


		

	

	def possibilities

		possibilities = Array.new
		possibilities = [ [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6] ]
	end





	def player_victory(board)
		
		for possible in possibilities
			if ((board[possible[0]].eql?(board[possible[1]])) && (board[possible[0]].eql?(board[possible[2]])) && board[possible[0]] != nil && board[possible[0]] == 'X' )
				return true
			end
		end
		return false
	end






	def computer_victory(board)
		for possible in possibilities
			if ((board[possible[0]].eql?(board[possible[1]])) && (board[possible[0]].eql?(board[possible[2]])) && board[possible[0]] != nil && board[possible[0]] == 'O' )
				return true
			end
		end
		return false
	end

	

end
