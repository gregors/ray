require "./spec_helper"

describe Vector do
  it ".new" do
    v = Vector.new(4.3, -4.2, 3.1)
    v.tup.should eq({4.3, -4.2, 3.1, 0.0})
    v.x.should eq 4.3
    v.y.should eq -4.2
    v.z.should eq 3.1
  end

 it "tuple with w=0.0 is a vector" do
    tup = {4.3, -4.2, 3.1, 0.0}
    Vector.is?(tup).should eq true
  end

 it "tuple without w=0.0 is not a vector" do
    tup = {4.3, -4.2, 3.1, 1.0}
    Vector.is?(tup).should eq false
  end
end
