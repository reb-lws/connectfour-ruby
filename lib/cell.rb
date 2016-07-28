class Cell
  attr_reader :side

  def initialize(side)
    @side = side
  end

  def inspect
    return @side
  end
end