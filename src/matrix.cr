class Matrix
  @data : Array(Array(Float64) | Array(Int32))
  def initialize(a, b, c, d)
   @data = [
     a.to_a,
     b.to_a,
     c.to_a,
     d.to_a
   ]
  end

  def []? (col : Int, row : Int ) : Float64 | Int32 | Nil
    @data[col][row]
  end
end
