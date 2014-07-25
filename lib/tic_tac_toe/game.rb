module TicTacToe
  class Game
    attr_reader :board
    attr_accessor :turn

    def initialize(ui) #REPLACE Input,output with UI
      #TicTacToe::Board.new(size),computer,
      @board = TicTacToe::Board.new(ui.get_board_size)
      if ui.get_difficulty == 1 || @board.tiles.length == 16
        @computer = TicTacToe::Computer.new
      else
        @computer = TicTacToe::Recursive_computer.new
      end
      @turn = false
      @ui = ui
    end

    def start
      again = true
      
      while (again == true)
        @board.reset
        @turn = @ui.get_first_turn
        @ui.print_instructions
        play
        @ui.display_board(@board)
        @ui.print_winner(@board,@turn)
        again = @ui.get_play_again
      end
    end

    def play
      take_turn until @board.over
    end

    def take_turn
      if @turn
        move = @ui.get_player_move(@board)
        @board.move(move,@turn)
      else
        if  @board.tiles.length -  @board.tiles.compact.length > 7 && @computer.instance_of?(Recursive_computer)
          @ui.print_thinking_message
        end
         @board.move(@computer.turn(@board.tiles), false)
      end
      @turn = !@turn
    end
  end
end
