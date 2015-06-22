require "tic_tac_toe/board"
require "tic_tac_toe/computer"

module TicTacToe
  describe Board do
    let (:board) {Board.new(9)}

    it "has a board" do
      board.tiles.should == Array.new(9,nil)
    end

    it "can make a move" do
      board.move(3,true)

      board.tiles[2].should == 'X'
    end

    it "can check for victory" do
      tiles = ['X','X','X',
               nil,nil,nil,
               nil,nil,nil]

      board.set_tiles(tiles)

      board.victory?.should == true
    end

    it "can check for a tie" do
      tiles = ['X','O','X',
               'X','O','X',
               'O','X','O']

      board.set_tiles(tiles)

      board.tie?.should == true
    end


    it "can reset the game" do
      tiles = ['X','O','X',
               'X','O','X',
               'O','X','O']

      board.set_tiles(tiles)
      board.reset

      board.tiles[0].should be_nil
    end


    it "can tell you when the game is over" do
      tiles = ['X','O','X',
               'X','O','X',
               'O','X','O']

      board.set_tiles(tiles)

      board.over.should == true
    end


    it "can tell you who the winner is" do
      tiles = ['X','X','X',
               'X','O','O',
               'O','X','O']

      board.set_tiles(tiles)
      board.victory?
      board.get_winner.should == 'X'
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
      it "returns an array of diagonal win combinations for a 3x3 board" do
        board.tiles.length.should == 9

        board.get_diagonal_wins.should == [[0, 4, 8], [2, 4, 6]]
      end

      it "returns an array of diagonal win combinations for a 4x4 board" do
        board = Board.new(16)

        board.get_diagonal_wins.should == [[0, 4, 8, 12], [2, 4, 6, 8]]
      end
      it "returns diagonal wins for a larger board" do
        board = Board.new(49)
        board.get_diagonal_wins.should == [[0, 9, 18, 27, 36, 45, 54], [6, 13, 20, 27, 34, 41, 48]]
      end
    end

    it "doesn't think the game is over when it isn't" do
      tiles = ['X','X',nil,
               nil,nil,nil,
               'O',nil,nil]
      board.set_tiles(tiles)
      board.get_winner.should be_nil
    end
  end
end
