module TicTacToe
  class Board
    attr_reader :tiles

    def initialize(size)
      @tiles  = Array.new(size,nil)
      @turn   = true
      @size   = size
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

    def get_winner(board = @tiles,turn = @turn,wins = possible_wins(@tiles.length))
      per_row = Math.sqrt(board.length)
      wins.each do |possible|
        counter = 0
        (0...per_row).each do |index|
          if (board[possible[index]] == board[possible[0]] && board[possible[0]] != nil)
            counter = counter + 1
          end
        end
        if (counter == per_row)
          return (turn ? 'X' : 'O')
        end
      end
      return nil
    end

  def get_horizontal_wins(board_length = @tiles.length)
    per_row = Math.sqrt(board_length)
    possible = []
    (0...board_length).each do |i|
      possible.push(i)
    end

    possible = possible.each_slice(per_row).to_a
  end

  def get_vertical_wins(horizontal,board_length = @tiles.length)
    vertical = []
    possible = []
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

  def get_diagonal_wins(possible,board_length = @tiles.length)
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
    return diag
  end

  def possible_wins(board_length)
    print (board_length)
    possible = []
    possible = possible + get_horizontal_wins(board_length)
    possible = possible + get_vertical_wins(possible,board_length)
    possible = possible.to_a + get_diagonal_wins(possible,board_length)
    return possible
  end

    def victory?
      !!get_winner(@tiles,@turn,possible_wins(@tiles.length))
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
end
