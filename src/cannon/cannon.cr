require "../point"
require "../vector"
require "./projectile"
require "./cannon_world"

class Cannon
  def self.run
    position = Point.new(0, 1, 0)
    velocity = Vector.new(1.1, 1, 0)
    projectile = Projectile.new(position, velocity)

    gravity = Vector.new(0, -0.1, 0)
    wind = Vector.new(-0.01, 0, 0)
    world = CannonWorld.new(gravity, wind)

    while projectile.position.y >= 0
      position = projectile.position
      puts "x: #{position.x}, y: #{position.y}"
      projectile = tick(world, projectile)
    end
  end

  def self.tick(world, projectile)
    position = projectile.position.add(projectile.velocity)
    velocity = projectile.velocity.add(world.gravity).add(world.wind)
    return Projectile.new(position, velocity)
  end
end

puts "running...."
Cannon.run
