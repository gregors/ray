class Color
  property :red
  property :green
  property :blue

  def initialize(@red : Float64, @green : Float64, @blue : Float64)
  end

  def +(other : Color)
    Color.new(red + other.red, green + other.green, blue + other.blue)
  end

  def -(other : Color)
    Color.new(red - other.red, green - other.green, blue - other.blue)
  end

  def *(other : Float64 | Color)
    if other.is_a?(Color)
      Color.new(red * other.red, green * other.green, blue * other.blue)
    else
      Color.new(red * other, green * other, blue * other)
    end
  end

  def ==(other : Color)
    close_enough(red, other.red) &&
      close_enough(green, other.green) &&
      close_enough(blue, other.blue)
  end

  def close_enough(a, b)
    (a - b).abs < 0.00001
  end
end
