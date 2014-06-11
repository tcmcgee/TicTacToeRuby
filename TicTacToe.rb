# personal design opinions for this class:
# instead of initializing and calling set_board and having any mutability
# I would have this interface:
#   initialize(board)
#   tie?               -> bool
#   has_winner?        -> bool
#   winner             -> 'x', 'o' (or 1, 2)
#   move(index, turn)  -> new TicTacToe
#
# What that means is
#   1: instances of this never change
#   2: users, instead of doing:
#     @tic_tac_toe.move(...)
#     now do:
#     @tic_tac_toe = @tic_tac_toe.move(...)

class TicTacToe
  attr_reader :board


	def initialize()
		@board  = Array.new 9
		@turn   = true
	end

  # another ehhh.
	def set_board(new_board)
		for i in (0...board.length)
			@board[i] = new_board[i]
		end
	end

	def move(index, turn)
    @board[index - 1] = (turn ? "X" : "O")
	end

  # see alternative below
	def tie?
    count = 0
    for tile in @board
      if (!tile.eql?(nil))
        count = count + 1
      end
    end

		if (victory? == false)
			if(count == board.length)
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
    @board.compact.size == board.length
	end

  # rename: winner
  def get_winner
		possibilities = [ [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6] ]
		for possible in possibilities
      # introduce some abstraction here
			if (@board[possible[0]].eql?(@board[possible[1]]) && @board[possible[0]].eql?(@board[possible[2]]) && @board[possible[0]] != nil  )
        return (@turn ? 'X' : 'O')
			end
		end
		return nil
	end

  # rename to something like has_winner?
  def victory?
    !!get_winner
  end

  # ehhhhhhh...
  # at least rename reset!
	def reset
		for i in (0...board.length)
			@board[i] = nil
		end
	end

  # rename: over?
	def over
		victory? || tie?
	end

end
