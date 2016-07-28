class Player
  attr_reader :side

  def initialize(side)
    @side = side
  end

  def inspect
    "Player#{@side}"
  end
end