require "./spec_helper"

describe PPM do
  describe ".new" do
    it "creates a PPM header" do
      c = Canvas.new(5, 3)
      ppm = PPM.new(c)
      ppm.lines[0].should eq "P3"
      ppm.lines[1].should eq "5 3"
      ppm.lines[2].should eq "255"
    end

    it "creates PPM pixel data" do
      c = Canvas.new(5, 3)
      c1 = Color.new(1.5,0,0)
      c2 = Color.new(0,0.5,0)
      c3 = Color.new(-0.5,0,1)
      c.write_pixel(0, 0, c1)
      c.write_pixel(2, 1, c2)
      c.write_pixel(4, 2, c3)
      ppm = PPM.new(c)
      ppm.lines[3].should eq "255 0 0 0 0 0 0 0 0 0 0 0 0 0 0"
      ppm.lines[4].should eq "0 0 0 0 0 0 0 128 0 0 0 0 0 0 0"
      ppm.lines[5].should eq "0 0 0 0 0 0 0 0 0 0 0 0 0 0 255"
    end

    it "splits long lines" do
      c = Canvas.new(10, 2)
      color = Color.new(1, 0.8, 0.6)
      2.times do |h|
        10.times do |w|
          c.write_pixel(w, h, color)
        end
      end
      ppm = PPM.new(c)
      ppm.lines[3].should match /.+204$/
      ppm.lines[4].should match /.+153$/
      ppm.lines[5].should match /.+204$/
      ppm.lines[6].should match /.+153$/
    end
  end

  describe "to_s" do
    it "terminated with a newline" do
      c = Canvas.new(5, 3)
      c1 = Color.new(1.5,0,0)
      c2 = Color.new(0,0.5,0)
      c3 = Color.new(-0.5,0,1)
      c.write_pixel(0, 0, c1)
      c.write_pixel(2, 1, c2)
      c.write_pixel(4, 2, c3)
      ppm = PPM.new(c)
      s = ppm.to_s
      s.should match /.+\n$/
    end
  end

  describe ".make_line" do
    it "joins things with a space" do
      line = PPM.make_line(["111", "0", "222"])
      line.should eq ["111 0 222"]
    end

    it "splits lines longer than 70" do
      input = Array.new(25){ "12" }
      line = PPM.make_line(input)
      line[0].size.should eq 68
      line[1].should eq "12 12"
    end
  end
end
