require "cell"

describe Cell do
  describe "#side" do
    it "displays its side" do
      expect(Cell.new("X").side).to eql("X")
      expect(Cell.new("O").side).to eql("O")
    end
  end

  describe "#inspect" do
    it "displays its side" do
      expect(Cell.new("X").inspect).to eql("X")
      expect(Cell.new("O").inspect).to eql("O")
    end
  end
end