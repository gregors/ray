class Matrix
  getter :rows
  getter :cols
  getter :data
  @data :  Array(Array(Float64) | Array(Int32)) |  Array(Array(Int32))
  def initialize(a, b, c, d)
    @rows = 4
    @cols = 4
    @data = [
      a.to_a,
      b.to_a,
      c.to_a,
      d.to_a
    ]
  end

  def initialize(a, b, c)
    @rows = 3
    @cols = 3
    @data = [
      a.to_a,
      b.to_a,
      c.to_a
    ]
  end

  def initialize(a, b)
    @rows = 2
    @cols = 2
    @data = [
      a.to_a,
      b.to_a
    ]
  end

  def []? (col : Int, row : Int ) : Float64 | Int32 | Nil
    @data[col][row]
  end

  def ==(other : Matrix)
    false if self.rows != other.rows || self.cols != other.cols
    a = self.data.flatten
    b = other.data.flatten
    b.zip(a).map{|x,y| (x-y).abs <= 0.00001}.all?
  end
end
