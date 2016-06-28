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

      if (has_winner? == false)
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
      return false if has_winner?
      @tiles.compact.size == size
    end

    def get_winner
      per_row = Math.sqrt(size)
      possible_wins.each do |possible|
        counter = 0
        winner = ''
        (0...per_row).each do |index|
          if (@tiles[possible[index]] == @tiles[possible[0]] && @tiles[possible[0]] != nil && @tiles[possible[index]] != nil)
            winner = @tiles[possible[0]]
            counter = counter + 1
          end
        end
        if (counter == per_row)
          return (winner)
        end
      end
      return nil
    end

    def possible_wins 
      possible_wins = Array.new
      possible_wins.push(*get_horizontal_wins)
      possible_wins.push(*get_vertical_wins)
      possible_wins.push(*get_diagonal_wins)
      possible_wins
    end

    def get_row_length
      Math.sqrt(tiles.length)
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

    def has_winner?
      !!get_winner
    end

    def reset
      (0...size).each do |i|
        @tiles[i] = nil
      end
    end

    def over
      has_winner? || tie?
    end

  end
end
