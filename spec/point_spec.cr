require "./spec_helper"

describe Point do
  it ".new" do
    p = Point.new(4.3, -4.2, 3.1)
    p.tup.should eq({ 4.3, -4.2, 3.1, 1.0 })
    p.x.should eq 4.3
    p.y.should eq -4.2
    p.z.should eq 3.1
    p.w.should eq 1.0
  end

  it "tuple with w=1.0 is a point" do
    Point.is?({ 4.3, -4.2, 3.1, 1.0 }).should eq true
  end

  it "tuple without w=1.0 is not a point" do
    Point.is?({ 4.3, -4.2, 3.1, 0.0 }).should eq false
  end

  describe ".add" do
    it "adding vector returns a new point" do
      p = Point.new(3.0, -2.0, 5.0)
      v = Vector.new(-2.0, 3.0, 1.0)
      p2 = p.add(v)
      p2.tup.should eq({1.0, 1.0, 6.0, 1.0})
    end
  end
end
