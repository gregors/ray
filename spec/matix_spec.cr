require "./spec_helper"

describe Matrix do
  describe ".new" do
    it "accepts tuples" do
      matrix = Matrix.new({1,2,3,4}, {5.5, 6.5, 7.5, 8.5}, {9, 10, 11, 12},{13.5, 14.5, 15.5, 16.5})
      matrix[0, 0]?.should eq 1
      matrix[0, 3]?.should eq 4
      matrix[1, 0]?.should eq 5.5
      matrix[1, 2]?.should eq 7.5
      matrix[2, 2]?.should eq 11
      matrix[3, 0]?.should eq 13.5
      matrix[3, 2]?.should eq 15.5
    end

    it "creates 2x2 matrix" do
      matrix = Matrix.new({-3, 5},{1, -2})
      matrix[0, 0]?.should eq -3
      matrix[0, 1]?.should eq 5
      matrix[1, 0]?.should eq 1
      matrix[1, 1]?.should eq -2
    end

    it "creates 3x3 matrix" do
      matrix = Matrix.new({-3, 5, 0},{1, -2, -7}, {0, 1, 1})
      matrix[0, 0]?.should eq -3
      matrix[1, 1]?.should eq -2
      matrix[2, 2]?.should eq 1
    end
  end
end

