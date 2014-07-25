require "tic_tac_toe/board"
require "tic_tac_toe/computer"

module TicTacToe
  describe Board do
    let (:board) {Board.new(9)}

    it "has a board" do
      expect(board.tiles).to eq(Array.new(9,nil))
    end

    it "can make a move" do
      board.move(3,true)

      expect(board.tiles[2]).to eq('X')
    end

    it "can check for victory" do
      tiles = ['X','X','X',
               nil,nil,nil,
               nil,nil,nil]

      board.set_tiles(tiles)

      expect(board.victory?).to eq(true)
    end

    it "can check for a tie" do
      tiles = ['X','O','X',
               'X','O','X',
               'O','X','O']

      board.set_tiles(tiles)

      expect(board.tie?).to eq(true)
    end


    it "can reset the game" do
      tiles = ['X','O','X',
               'X','O','X',
               'O','X','O']

      board.set_tiles(tiles)
      board.reset

      expect(board.tiles[0]).to eq(nil)
    end


    it "can tell you when the game is over" do
      tiles = ['X','O','X',
               'X','O','X',
               'O','X','O']

      board.set_tiles(tiles)

      expect(board.over).to eq(true)
    end


    it "can tell you who the winner is" do
      tiles = ['X','X','X',
               'X','O','O',
               'O','X','O']

      board.set_tiles(tiles)
      board.victory?
      expect(board.get_winner).to eq('X')
    end

    it "can get the horizontal victory for any sized board" do
      tiles = ['X','X','X',
               'X','O','O',
               'O','X','O']

      board.get_horizontal_wins(tiles.length) =~ [[0,1,2],[3,4,5],[6,7,8]]
    end

    it "can get the vertical victory for any sized board" do
      tiles = ['X','X','X',
               'X','O','O',
               'O','X','O']
      board.get_vertical_wins([[0,1,2],[3,4,5],[6,7,8]],tiles.length) =~ [[0,3,6],[1,4,7],[2,5,8]]
    end

    describe "diagonal wins" do
      xit "can get the diagonal victory for any sized board" do
        tiles = ['X','X','X',
                 'X','O','O',
                 'O','X','O']
        board.get_diagonal_wins([[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8]],tiles.length) =~ [[0,4,8],[2,4,6]]
      end

      it "returns an array of diagonal win combinations for a 3x3 board" do
        board.tiles.length.should == 9

        board.get_diagonal_wins.should == [[0, 4, 8], [2, 4, 6]]
      end

      it "returns an array of diagonal win combinations for a 4x4 board" do
        board = Board.new(16)

        board.get_diagonal_wins.should == [[0, 4, 8, 12], [2, 4, 6, 8]]
      end
    end

    xit "doesn't think the game is over when it isn't" do
      tiles = ['X','X',nil,
               nil,nil,nil,
               'O',nil,nil]
      board.set_tiles(tiles)
      expect(board.get_winner).to eq(nil)
    end
  end
end
