class TicTacToe
	attr_reader :board

	def initialize
		@board  = Array.new(9,nil)
		@turn   = true
		@size = 9
	end

	def set_board(new_board)
		@board = new_board
	end

	def move(index, turn)
		@board[index - 1] = (turn ? "X" : "O")
	end

	def get_board
		return @board
	end

	def get_string_board
		string_board = Array.new
		counter = 0
		board.each{|tile|
		if (tile == nil)
		tile = " _ "
		else
			tile = " " + tile.to_s + " "
		end
		string_board[counter] = tile
		counter = counter + 1}
		string_board
	end

	def tie?
		return false if has_winner?
		@board.compact.size == board.length
	end

	def get_winner
		for win in possible_wins
			if (@board[win[0]].eql?(@board[win[1]]) && @board[win[0]].eql?(@board[win[2]]) && @board[win[0]] != nil  )
				return (@turn ? 'X' : 'O')
			end
		end
		nil
	end

	def has_winner?
		!!get_winner
	end

	def reset
		(0...board.length).each do |i|
			@board[i] = nil
		end
	end

  def over
  	has_winner? || tie?
  end

def possible_wins 
  	possible_wins = Array.new
  	possible_wins.push(*get_horizontal_wins)
  	possible_wins.push(*get_vertical_wins)
  	possible_wins.push(*get_diagonal_wins)
  	possible_wins
  end

  def get_row_length
  	Math.sqrt(board.length)
  end

  def get_horizontal_wins
  	row_length = get_row_length
  	horizontal_wins = Array.new
  	count = 0
  	(0...row_length).each do |row|
  		win = Array.new(row_length)
  		(0...row_length).each do |col|
  			win[col] = count
  			count += 1
  		end
  		horizontal_wins.push(win)
  	end
  	horizontal_wins
  end

  def get_vertical_wins
    row_length = get_row_length
    vertical_wins = Array.new
    count = 0
  	(0...row_length).each do |row|
  		win = Array.new(row_length)
  		count = row
  		(0...row_length).each do |col|
        win[col] = count
        count += row_length
      end
      vertical_wins[row] = win
    end
    vertical_wins
   end

  def get_diagonal_wins
  	row_length = get_row_length
  	left_diag = Array.new
  	right_diag = Array.new
  	left = 0
  	right = row_length - 1
  	(0...row_length).each do |row|
  		left_diag.push(left)
  		right_diag.push(right)
  		left += row_length + 1
  		right += row_length - 1
  	end
  	[left_diag, right_diag]
  end
end