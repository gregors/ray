class Point
  def self.is?(tup)
    tup[3] == 1.0
  end

  def initialize(tup : Tuple(Float64, Float64, Float64, Float64))
    @tup = tup
  end

  def self.x(tup)
    tup[0]
  end

  def self.y(tup)
    tup[1]
  end

  def self.z(tup)
    tup[2]
  end
end
