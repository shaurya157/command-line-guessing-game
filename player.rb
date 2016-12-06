class Player

  def initialize(name)
    @name = name
  end

  def get_guess
    puts "Please enter a valid move as: row, column"
    move = gets.chomp
    move = move.scan(/[0-9]/).map { |x| x.to_i }
  end

  def receive_card(_, _)
  end

end
