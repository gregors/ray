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

  def w
    @tup[3]
  end

  def ==(other : Vector)
    x == other.x &&
      y == other.y &&
      z == other.z &&
      w == other.w
  end

  def add(t : Point | Vector )
    if t.is_a?(Point)
      Point.new(x + t.x, y + t.y, z + t.z)
    else
      Vector.new(x + t.x, y + t.y, z + t.z)
    end
  end

  def sub(v : Vector)
    Vector.new(x - v.x, y - v.y, z - v.z)
  end

  def -
    Vector.new(0 - x, 0 - y, 0 - z)
  end

  def *(scalar : Float64)
    Vector.new(x * scalar, y * scalar, z * scalar)
  end

  def /(scalar : Float64)
    Vector.new(x / scalar, y / scalar, z / scalar)
  end

  def magnitude
    ( x**2 + y**2 + z**2 + w**2) ** 0.5
  end

  def normalize
    mag = magnitude
    Vector.new(x/mag, y/mag, z/mag)
  end

  def dot(other : Vector)
    x * other.x + y * other.y + z * other.z
  end

  def cross(v : Vector)
    Vector.new(y * v.z - z * v.y,
               z * v.x - x * v.z,
               x * v.y - y * v.x)
  end
end
