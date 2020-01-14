require "./spec_helper"

describe Canvas do
  describe ".new" do
    it "sets width and height" do
      c = Canvas.new(10, 20)
      c.width.should eq 10
      c.height.should eq 20
    end

    it "default pixels are black" do
      black = Color.new(0,0,0)
      c = Canvas.new(10, 20)
      10.times do |w|
        20.times do |h|
          c.pixel_at(w, h).should eq black
        end
      end
    end
  end

  describe ".pixel_at" do
    it "gets the pixel at" do
      c = Canvas.new(10, 20)
      c.pixel_at(0, 0).class.should eq Color
    end
  end

  describe ".write_pixel" do
    it "sets the pixel color" do
      black = Color.new(0,0,0)
      red = Color.new(1,0,0)

      c = Canvas.new(10, 20)
      c.pixel_at(2, 3).should eq black
      c.write_pixel(2, 3, red)
      c.pixel_at(2, 3).should eq red
    end
  end

  describe "#to_ppm" do
    it "creates a PPM header" do
      c = Canvas.new(5, 3)
      ppm = c.to_ppm
      ppm.lines[0].should eq "P3"
      ppm.lines[1].should eq "5 3"
      ppm.lines[2].should eq "255"
    end
  end
end
