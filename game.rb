require_relative 'card.rb'
require_relative 'player.rb'
require_relative 'board.rb'
require_relative 'computer_player.rb'

class Game

  def initialize(board, player)
    @board = board
    @player = player
  end

  def render
    puts "-----------------------------"
    @board.grid.each.with_index do |row, index|
      str = "#{index} | "
      row.each do |card|
        card.current_state ? str += " #{card.display} |" : str += " ◙ |"
      end
      puts str
      puts "-----------------------------"
    end
  end

  def play
    until @board.grid.flatten.all? { |card| !card.display.nil? }

      x, y = take_turn
      card1 = @board.grid[x][y]
      card1.reveal
      @player.receive_card(card1.display, [x, y])
      render

      a, b = take_turn
      card2 = @board.grid[a][b]
      card2.reveal
      @player.receive_card(card2.display, [a, b])
      render

      unless card1 == card2
        card1.hide
        card2.hide
      end
    end
  end

  def valid_move?(guess)
    x, y = guess
    if @board.grid[x][y].display
      return false
    end
    true
  end

  def take_turn
    sleep(1)
    system('clear')
    guess = @player.get_guess
    until valid_move?(guess)
      puts "Invalid move"
      guess = @player.get_guess
    end
    guess
  end
end

if __FILE__ == $PROGRAM_NAME
  board = Board.new(6)
  player = Player.new('player1')
  computer = ComputerPlayer.new('comp', board.grid.length)
  game = Game.new(board, computer)
  game.play
end
