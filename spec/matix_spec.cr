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
  end
end

