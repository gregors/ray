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

  describe "equality between matrices" do
    it "when equal returns true" do
      a = Matrix.new({1, 2, 3, 4},
                     {5, 6, 7, 8},
                     {9, 8, 7, 6},
                     {5, 4, 3, 2})

      b = Matrix.new({1, 2, 3, 4},
                     {5, 6, 7, 8},
                     {9, 8, 7, 6},
                     {5, 4, 3, 2})
      a.should eq b
    end

    it "when different returns false" do
      a = Matrix.new({1, 2, 3, 4},
                     {5, 6, 7, 8},
                     {9, 8, 7, 6},
                     {5, 4, 3, 2})

      b = Matrix.new({2, 3, 4, 5},
                     {6, 7, 8, 9},
                     {8, 7, 6, 5},
                     {4, 3, 2, 1})

      a.should_not eq b
    end
  end

  describe "multiply 2 4x4 matrices" do
   it "returns a new 4x4 matrix" do
      a = Matrix.new({1, 2, 3, 4},
                     {5, 6, 7, 8},
                     {9, 8, 7, 6},
                     {5, 4, 3, 2})

      b = Matrix.new({-2, 1, 2, 3},
                     {3, 2, 1, -1},
                     {4, 3, 6, 5},
                     {1, 2, 7, 8})

      c = a * b

      d = Matrix.new({20, 22, 50, 48},
                     {44, 54, 114, 108},
                     {40, 58, 110, 102},
                     {16, 26, 46, 42})
      c.should eq d
   end
  end
end

