require "./spec_helper"

describe Color do
  it ".new" do
    c = Color.new(-0.5, 0.4, 1.7)
    c.red.should eq -0.5
    c.green.should eq 0.4
    c.blue.should eq 1.7
  end

  describe "adding colors" do
    it "+ adds colors" do
      c1 = Color.new(0.9, 0.6, 0.75)
      c2 = Color.new(0.7, 0.1, 0.25)
      c3 = c1 + c2
      c3.should eq Color.new(1.6, 0.7, 1.0)
    end
  end

  describe "subtracting colors" do
    it "- subtracts colors" do
      c1 = Color.new(0.9, 0.6, 0.75)
      c2 = Color.new(0.7, 0.1, 0.25)
      c3 = c1 - c2
      c3.should eq Color.new(0.2, 0.5, 0.5)
    end
  end

  describe "multiplyting a color by a scalar" do
    it "- subtracts colors" do
      c1 = Color.new(0.2, 0.3, 0.4)
      c2 = c1 * 2
      c2.should eq Color.new(0.4, 0.6, 0.8)
    end
  end

  describe "multiplyting a color by a color" do
    it "- subtracts colors" do
      c1 = Color.new(1, 0.2, 0.4)
      c2 = Color.new(0.9, 1, 0.1)
      c3 = c1 * c2
      c3.should eq Color.new(0.9, 0.2, 0.04)
    end
  end
end
