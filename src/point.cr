class Point
  getter :tup

  def self.is?(tup)
    tup[3] == 1.0
  end

  def initialize(x : Float64, y : Float64, z : Float64)
    @tup = {x, y, z, 1.0}
  end

  def x
    @tup[0]
  end

  def y
    @tup[1]
  end

  def z
    @tup[2]
  end

  def w
    @tup[3]
  end
end
