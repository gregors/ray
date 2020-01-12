require "./spec_helper"

describe Point do
  it ".new" do
    tup = {4.3, -4.2, 3.1, 1.0}
    Point.new(tup).should_not eq nil
  end

 it "tuple with w=1.0 is a point" do
    tup = {4.3, -4.2, 3.1, 1.0}
    Point.is?(tup).should eq true
    Point.x(tup).should eq 4.3
    Point.y(tup).should eq -4.2
    Point.z(tup).should eq 3.1
  end

 it "tuple without w=1.0 is not a point" do
    tup = {4.3, -4.2, 3.1, 0.0}
    Point.is?(tup).should eq false
  end
end
