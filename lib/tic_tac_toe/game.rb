require_relative "TicTacToe"
require_relative "Computer"

module TicTacToe
  class Game
    attr_reader :tictactoe

    def initialize(tictactoe, computer,ui) #REPLACE Input,output with UI
      @tictactoe = tictactoe
      @computer = computer
      @turn = false
      @ui = ui
    end

    def start
      again = true
      @ui.print_instructions
      while (again == true)
        @tictactoe.reset
        self.turn = @ui.get_first_turn
        play
        @ui.display_board(@tictactoe)
        @ui.print_winner(@tictactoe,@turn)
        again = @ui.get_play_again
      end
    end

    def play
      take_turn until @tictactoe.over
    end

    def take_turn
      if turn
        move = @ui.get_player_move(@tictactoe)
      else
        if @tictactoe.tiles.length - @tictactoe.tiles.compact.length > 7 && @computer.instance_of?(Recursive_computer)
          @ui.print_thinking_message
        end
        @tictactoe.move(@computer.Turn(@tictactoe.tiles), false)
      end
      self.turn = !turn
    end

    def turn
      @turn
    end

    def turn=(turn)
      @turn = turn
    end
  end
end
