class Projectile
  getter :position
  getter :velocity

  def initialize(@position : Point, @velocity : Vector)
  end
end
