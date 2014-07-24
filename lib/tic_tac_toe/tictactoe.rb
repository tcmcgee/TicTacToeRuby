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
end
