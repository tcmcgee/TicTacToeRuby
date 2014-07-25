module TicTacToe
  class Game
    attr_reader :board

    def initialize(board, computer,ui) #REPLACE Input,output with UI
      @board = board
      @computer = computer
      @turn = false
      @ui = ui
    end

    def start
      again = true
      @ui.print_instructions
      while (again == true)
        @board.reset
        self.turn = @ui.get_first_turn
        play
        @ui.display_board(@board)
        @ui.print_winner(@board,@turn)
        again = @ui.get_play_again
      end
    end

    def play
      take_turn until  @board.over
    end

    def take_turn
      if turn
        move = @ui.get_player_move(@board)
      else
        if  @board.tiles.length -  @board.tiles.compact.length > 7 && @computer.instance_of?(Recursive_computer)
          @ui.print_thinking_message
        end
         @board.move(@computer.turn(@board.tiles), false)
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
