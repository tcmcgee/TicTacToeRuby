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
  end
end
