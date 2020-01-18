class Canvas
  getter :width
  getter :height
  getter :canvas

  @canvas : Array(Array(Color))

  def initialize(@width : Int32, @height : Int32)
    @canvas = (0...@height).map do
      Array.new(@width){ Color.new(0,0,0) }
    end
  end

  def pixel_at(width = 0, height = 0)
    @canvas[height][width]
  end

  def write_pixel(row : Int32, col : Int32, color : Color)
    c = @canvas[col][row]
    c.red = color.red
    c.green = color.green
    c.blue = color.blue
  end

  def to_ppm
    PPM.new(self).to_s
  end
end
