require "tic_tac_toe/tictactoe"
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

<<<<<<< HEAD
	it "can check for victory" do
				board = ['X','X','X',
						nil,nil,nil,
						nil,nil,nil]
				game.set_board(board)
		expect(game.victory?).to eq(true)
	end
=======
      expect(board.victory?).to eq(true)
    end
>>>>>>> b48c71e7faa65d21df5fb0b89dd1935786c0e91a

    it "can check for a tie" do
      tiles = ['X','O','X',
               'X','O','X',
               'O','X','O']

<<<<<<< HEAD
				board = ['X','O','X',
						'X','O','X',
						'O','X','O']
				game.set_board(board)
		expect(game.tie?).to eq(true)
=======
      board.set_tiles(tiles)
>>>>>>> b48c71e7faa65d21df5fb0b89dd1935786c0e91a

      expect(board.tie?).to eq(true)
    end


<<<<<<< HEAD
	it "can reset the game" do
		board = ['X','O','X',
				'X','O','X',
				'O','X','O']
		game.set_board(board)
		game.reset
		expect(game.board[0]).to eq(nil)
	end
=======
    it "can reset the game" do
      tiles = ['X','O','X',
               'X','O','X',
               'O','X','O']
>>>>>>> b48c71e7faa65d21df5fb0b89dd1935786c0e91a

      board.set_tiles(tiles)
      board.reset

<<<<<<< HEAD
	it "can tell you when the game is over" do
		board = ['X','O','X',
				'X','O','X',
				'O','X','O']
		game.set_board(board)
		expect(game.over).to eq(true)
	end


	it "can tell you who the winner is" do
			board = ['X','X','X',
					'X','O','O',
					'O','X','O']
			game.set_board(board)
			game.victory?
			expect(game.get_winner).to eq('X')
	end

	it "can get the horizontal victory for any sized board" do
		game.get_horizontal_wins =~ [[0,1,2],[3,4,5],[6,7,8]] 
	end

	it "can get the vertical victory for any sized board" do
		game.get_vertical_wins([[0,1,2],[3,4,5],[6,7,8]]) =~ [[0,3,6],[1,4,7],[2,5,8]] 
	end
	
	it "can get the diagonal victory for any sized board" do
		game.get_diagonal_wins([[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8]]) =~ [[0,4,8],[2,4,6]] 
	end
=======
      expect(board.tiles[0]).to eq(nil)
    end


    it "can tell you when the game is over" do
      tiles = ['X','O','X',
               'X','O','X',
               'O','X','O']

      board.set_tiles(tiles)

      expect(board.over).to eq(true)
    end
>>>>>>> b48c71e7faa65d21df5fb0b89dd1935786c0e91a


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
