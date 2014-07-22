<<<<<<< HEAD

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

=======
module TicTacToe
  class Board
    attr_reader :tiles

    def initialize(size)
      @tiles  = Array.new(size,nil)
      @turn   = true
      @size = size
    end

    def size
      @size
    end

    def set_tiles(new_tiles)
      (0...@size).each do |i|
        @tiles[i] = new_tiles[i]
      end
    end

    def move(index, turn)
      @tiles[index - 1] = (turn ? "X" : "O")
    end

    def tie?
      count = 0
      @tiles.each do |tile|
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
      return @tiles
    end

    def tie?
      return false if victory?
      @tiles.compact.size == size
    end

    def get_winner
      if size == 9
        possibilities = [ [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6] ]
      elsif size == 16
        possibilities = [[0, 1, 2, 3], [4, 5, 6, 7], [8, 9, 10, 11], [12, 13, 14, 15], [0, 4, 8, 12], [1, 5, 9, 13], [2, 6, 10, 14], [3, 7, 11, 15], [0, 5, 10, 15], [3, 6, 9, 12]]
      end

      possibilities.each do |possible|
        if size == 9
          if (@tiles[possible[0]].eql?(@tiles[possible[1]]) && @tiles[possible[0]].eql?(@tiles[possible[2]]) && @tiles[possible[0]] != nil  )
            return (@turn ? 'X' : 'O')
          end
        else
          if (@tiles[possible[0]].eql?(@tiles[possible[1]]) && @tiles[possible[0]].eql?(@tiles[possible[2]]) && @tiles[possible[0]].eql?(@tiles[possible[3]]) && @tiles[possible[0]] != nil  )
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
      (0...size).each do |i|
        @tiles[i] = nil
      end
    end

    def over
      victory? || tie?
    end

  end
>>>>>>> b48c71e7faa65d21df5fb0b89dd1935786c0e91a
end
