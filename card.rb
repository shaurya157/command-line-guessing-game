class Card
  attr_accessor :current_state

  def initialize(value)
    @current_state = false
    @value = value
  end

  def display
    @current_state ? @value : nil
  end

  def hide
    @current_state = false
  end

  def reveal
    @current_state = true
  end

  def ==(card)
    self.display == card.display
  end
end
