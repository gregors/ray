class Matrix
  getter :data
  @data : Array(Array(Float64))

  def initialize(nums)
    @data = nums.map { |rows| rows.map { |col| col.to_f } }
  end

  def []?(row : Int, col : Int) : Float64
    @data[row][col]
  end

  def []=(row : Int32, col : Int32, data : Float64)
    @data[row][col] = data.to_f
  end

  def *(other : Matrix)
    new_matrix = Matrix.new([[0, 0, 0, 0],
                             [0, 0, 0, 0],
                             [0, 0, 0, 0],
                             [0, 0, 0, 0]])

    4.times do |r|
      4.times do |c|
        cell = @data[r][0] * other.@data[0][c]
        cell += @data[r][1] * other.@data[1][c]
        cell += @data[r][2] * other.@data[2][c]
        cell += @data[r][3] * other.@data[3][c]
        new_matrix[r, c] = cell
      end
    end

    new_matrix
  end

  def ==(other : Matrix)
    a = self.data.flatten
    b = other.data.flatten
    b.zip(a).map { |x, y| (x - y).abs <= 0.00001 }.all?
  end
end
