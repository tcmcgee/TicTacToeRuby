module TicTacToe
  class Board
    attr_reader :tiles

    def initialize(size)
      @tiles  = Array.new(size,nil)
      @turn   = true
      @size   = size
    end

    def turn=(turn)
      @turn = turn
    end

    def size
      @size
    end

    def set_tiles(new_tiles)
      (0...new_tiles.length).each do |i|
        @tiles[i] = new_tiles[i]
      end
      @size = new_tiles.length
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
      per_row = Math.sqrt(size) #=> 3
      possible_wins(@tiles.length).each do |possible|
        counter = 0
        (0...per_row).each do |index|
          if (@tiles[possible[index]] == @tiles[possible[0]] && @tiles[possible[0]] != nil && @tiles[possible[index]] != nil)
            counter = counter + 1
          end
        end
        if (counter == per_row)
          return (@tiles[possible[index]])
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

  def get_diagonal_wins
    per_row = Math.sqrt(@tiles.length).to_i

    left_diagonal_wins = (0...per_row).reduce([]) {
      |wins, num| wins.push(4 * num)
    }
    right_diagonal_wins = (1...(per_row + 1)).reduce([]) { |wins, num| wins.push(num + num) }

    [].push(left_diagonal_wins, right_diagonal_wins)
  end

  def possible_wins(board_length)
    possible = get_horizontal_wins(board_length)
    possible = possible + get_vertical_wins(possible,board_length)
    possible = possible.to_a + get_diagonal_wins
    return possible
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
end
