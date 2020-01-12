require "./spec_helper"

describe Vector do
  it ".new" do
    v = Vector.new(4.3, -4.2, 3.1)
    v.tup.should eq({4.3, -4.2, 3.1, 0.0})
    v.x.should eq 4.3
    v.y.should eq -4.2
    v.z.should eq 3.1
    v.w.should eq 0.0
  end

 it "tuple with w=0.0 is a vector" do
    tup = {4.3, -4.2, 3.1, 0.0}
    Vector.is?(tup).should eq true
  end

 it "tuple without w=0.0 is not a vector" do
    tup = {4.3, -4.2, 3.1, 1.0}
    Vector.is?(tup).should eq false
  end

  describe ".add" do
    it "adding a point returns a new point" do
      p = Point.new(3.0, -2.0, 5.0)
      v = Vector.new(-2.0, 3.0, 1.0)
      p2 = v.add(p)
      p2.tup.should eq({1.0, 1.0, 6.0, 1.0})
    end

    it "adding a vector returns a new vector" do
      v1 = Vector.new(3.0, -2.0, 5.0)
      v2 = Vector.new(-2.0, 3.0, 1.0)
      v3 = v1.add(v2)
      v3.tup.should eq({1.0, 1.0, 6.0, 0.0})
    end
  end
end
