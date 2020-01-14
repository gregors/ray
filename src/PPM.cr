class PPM
  getter :lines

  def initialize(@canvas : Canvas)
    @lines = [ "P3", "#{@canvas.width} #{@canvas.height}", "255" ]
  end
end
