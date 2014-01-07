class MiniMaxComputer



	def initialize
		@possible = [0,0,0,0,0,0,0,0,0]


		@lowest = 1000000000
		@highest = -10000000000

		@lowest_index = -1
		@highest_index = -1
	end


	def tree(board,level,turn,turn_level)
		
		if (turn == false)
			move_char = 'O'
		else
			move_char = 'X'
		end
		if board[9] != nil
			index = board[9]

			
			if (computer_victory(board))
				@possible[index] = @possible[index] - (2  * (level + (10 * turn_level))) 

				
			end
			
			if  (player_victory(board))

				@possible[index] = @possible[index] + (2 * (level +(10 * turn_level)))
			
			end

			#	@possible[board[9]] = @possible[board[9]] - (100)
				

			#end
		end

		for i in (0...9)
			if (board[i] != nil)


				
			#elsif (level == 0 && player_victory(board) == false)
			#	@possible[board[9]] = @possible[board[9]] - 1


			elsif (player_victory(board) || computer_victory(board) || level == 0)


			else
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
		print @possible
		print @possible_divider

		print @possible
		best(board)
		
		reset
		

		return @lowest_index + 1


		
	end


	def reset		
		@lowest = Float::INFINITY
		@highest = -1
		@possible = [0,0,0,0,0,0,0,0,0]


	end

	def best(board)
		best_player(board)
		best_computer(board)
	end

	def best_player(board)
		for i in (0...9) do
			if (@possible[i] > @highest)
				 @highest = @possible[i]
				@highest_index = i
			end

		end

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
