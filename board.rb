
class Board
  attr_accessor :grid

  def initialize(size = 6)
    @size = size
    @grid = Array.new(size) { Array.new(size) }
    populate
  end

  def populate
    arr = card_value

    @grid.each_index do |i|
      @grid[i].each_index do |j|
        @grid[i][j] = Card.new(arr.pop)
      end
    end
  end

  def card_value
    arr = (1..(@size**2)/2).map {|n| n}
    arr += arr
    arr.shuffle
  end

end
