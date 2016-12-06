class ComputerPlayer

  def initialize(name, length)
    @cards_seen = {}
    @possible_moves = possible_moves(length)
    @name = name
    @guess_number = 1
    @winning_position = []
    @positions_done = []
  end

  def change_guess_number
    @guess_number != 1 ? (@guess_number = 1) : (@guess_number = 2)
  end

  def get_guess
    if !@winning_position.empty?
      arr = @winning_position.pop
      @positions_done << arr
      p arr
      arr
    else
      a = @possible_moves.pop
      p a
      a
    end
  end

  def possible_moves(length)
    arr = []
    (length).times do |row|
      (length).times do |column|
        arr << [row, column]
      end
    end

    arr.shuffle
  end

  def receive_card(num, pos)
    p "Guess number: #{@guess_number}"
    if @guess_number == 1 && @cards_seen[num]
      @winning_position << @cards_seen.delete(num)
      change_guess_number
    elsif @cards_seen[num]
      @winning_position << @cards_seen[num] unless @positions_done.include?(@cards_seen[num])
      @winning_position << pos unless @positions_done.include?(pos)
      change_guess_number
    else
      @cards_seen[num] = pos
      change_guess_number
    end

    p "winning_position: #{@winning_position}"
  end
end
