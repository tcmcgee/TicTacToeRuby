require "tic_tac_toe/recursive_computer"
require "tic_tac_toe/tictactoe"
require "tic_tac_toe/game"

module TicTacToe
  describe Recursive_computer do
    let (:computer) {Recursive_computer.new}

    it "Blocks a player win" do
      board = ['X','X',nil,
               nil,'O',nil,
               nil,'O',nil]

      computer.turn(board).should == 3
    end

    it "Wins when given the option" do
      board = ['O','O',nil,
               nil,nil,nil,
               nil,nil,nil]
      computer.turn(board).should == 3
    end

    it "Can block the two corner trick" do
      board = ['X',nil,nil,
               nil,'O',nil,
               nil,nil,'X']
      computer.turn(board).should == 2
    end

    it "returns possible wins for a 3x3" do
      computer.possible_wins(9).should =~ [
        [0, 1, 2], [0, 3, 6], [1, 4, 7],
        [3, 4, 5], [2, 5, 8], [0, 4, 8],
        [6, 7, 8], [2, 4, 6]
      ]
    end

    it "Prefers winning over blocking a player win" do
      board = [nil,nil,nil,
               'O','O',nil,
               nil,'X','X']
      computer.turn(board).should == 6
    end

    it "should block an immediate loss over a  future win" do

      board = ['X','X',nil,
               nil,'O',nil,
               nil,nil,nil]
      computer.turn(board).should == 3
    end

    xit "Never loses a game when the player goes first", t:true, :speed => 'slow'do
      tictactoe = TicTacToe.new(9)
      play_all_games(tictactoe.board,true)
    end

    xit "Never loses a game when the computer goes first", :speed => 'slow' do
      tictactoe = TicTacToe.new(9)
      play_all_games(tictactoe.board,false)
    end
    def play_all_games(board,turn)
      over = false
      playermoves = []
      if (player_victory(board))
        raise_exception_beatable
        puts board
        over = true
      end
      if (computer_victory(board))
        over = true
      end
      if (tie?(board))
        over = true
      end

      temp_board = Array.new
      for i in (0...board.length)
        temp_board[i] = board[i]
      end
      if (!over)
        if turn
          for i in (0...board.length)
            if temp_board[i] == nil
              temp_board[i] = 'X'
              play_all_games(temp_board,!turn)
              temp_board[i] = nil
            end
          end
        else
          move = computer.turn(board)
          temp_board[move - 1] = 'O'
          play_all_games(temp_board,!turn,)
        end
      end
    end

    def raise_exception_beatable
      raise "This game is beatable!"
      print board
    end

    def tie?(board)
      count = 0
      for tile in board
        if (!tile.eql?(nil))
          count = count + 1
        end
      end
      if (player_victory(board) == false && computer_victory(board) == false)
        if(count == board.length)
          return true
        else
          return false
        end

      else
        return false
      end
    end

    def player_victory(board)
      for possible in possible_wins(board)
        if board.length == 9
          if ((board[possible[0]].eql?(board[possible[1]])) && (board[possible[0]].eql?(board[possible[2]])) && board[possible[0]] != nil && board[possible[0]] == 'X' )
            return true
          end
        else
          if (board[possible[0]].eql?(board[possible[1]]) && board[possible[0]].eql?(board[possible[2]]) && board[possible[0]].eql?(board[possible[3]]) && board[possible[0]] != nil && board[possible[0]] = 'X')
            return true
          end
        end
      end
      return false
    end

    def computer_victory(board)
      for possible in possible_wins(board)
        if board.length == 9
          if ((board[possible[0]].eql?(board[possible[1]])) && (board[possible[0]].eql?(board[possible[2]])) && board[possible[0]] != nil && board[possible[0]] == 'O' )
            return true
          end
        else
          if (board[possible[0]].eql?(board[possible[1]]) && board[possible[0]].eql?(board[possible[2]]) && board[possible[0]].eql?(board[possible[3]]) && board[possible[0]] != nil && board[possible[0]] == 'O')
            return true
          end
        end
      end
      return false
    end

    def possible_wins(board)
      possible_wins = Array.new
      if board.length == 9
        possible_wins = [ [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6] ]
      elsif board.length == 16
        possible_wins = [[0, 1, 2, 3], [4, 5, 6, 7], [8, 9, 10, 11], [12, 13, 14, 15], [0, 4, 8, 12], [1, 5, 9, 13], [2, 6, 10, 14], [3, 7, 11, 15], [0, 5, 10, 15], [3, 6, 9, 12]]
      end
    end

  end
end
