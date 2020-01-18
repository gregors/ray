require "../point"
require "../vector"
require "./projectile"
require "./cannon_world"
require "../canvas"
require "../color"

class Cannon
  def self.run
    height = 550
    canvas = Canvas.new(900, height)
    position = Point.new(0, 1, 0)
    velocity = Vector.new(1, 1.8, 0).normalize * 11.25
    projectile = Projectile.new(position, velocity)

    gravity = Vector.new(0, -0.1, 0)
    wind = Vector.new(-0.01, 0, 0)
    world = CannonWorld.new(gravity, wind)
    red = Color.new(1, 0, 0)

    while projectile.position.y >= 0
      position = projectile.position
      canvas.write_pixel(position.x.to_i, height - position.y.to_i, red)
      projectile = tick(world, projectile)
    end

    print canvas.to_ppm
  end

  def self.tick(world, projectile)
    position = projectile.position.add(projectile.velocity)
    velocity = projectile.velocity.add(world.gravity).add(world.wind)
    return Projectile.new(position, velocity)
  end
end

Cannon.run
