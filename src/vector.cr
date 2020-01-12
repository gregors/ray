class Vector
  getter :tup

  def initialize(x : Float64, y : Float64, z : Float64)
    @tup = {x, y, z, 0.0}
  end

  def self.is?(tup)
    tup[3] == 0.0
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
end
