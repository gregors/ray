class PPM
  getter :lines

  def self.make_line(items)
    line = [] of String
    count = 0

    items.each do |item|
      if count + item.size >= 70
        line.pop if line.last == " "
        line << "\n"
        count = 0
      end
      line << item
      count += item.size
      line << " "
      count += 1
    end

    line.join.strip.split("\n")
  end

  def initialize(@canvas : Canvas)
    @max = 255
    @lines = [ "P3", "#{@canvas.width} #{@canvas.height}", @max.to_s]

    lines = @canvas.canvas.map do |line|
      converted = convert_color_to_number_string(line)
      PPM.make_line(converted)
    end

    @lines = (@lines + lines).flatten
  end

  def convert_color_to_number_string(line)
    line.map do |color|
      [
        (color.red * @max).round.clamp(0, @max).to_i.to_s,
        (color.green * @max).round.clamp(0, @max).to_i.to_s,
        (color.blue * @max).round.clamp(0, @max).to_i.to_s,
      ]
    end.flatten
  end

  def to_s
    (@lines + ["\n"]).join("\n")
  end
end
