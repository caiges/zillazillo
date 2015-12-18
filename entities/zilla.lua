Zilla = {}

function Zilla:new(world, x, y)
  body = love.physics.newBody(world, x, y, "dynamic")
  shape = love.physics.newCircleShape(40)
  fixture = love.physics.newFixture(body, shape, 1)
  fixture:setRestitution(0)

  body_2 = love.physics.newBody(world, x, y, "dynamic")
  shape_2 = love.physics.newCircleShape(10)
  fixture_2 = love.physics.newFixture(body_2, shape_2, 1)
  fixture_2:setRestitution(0)

  newObj = {
    x = x,
    y = y,
    segments = 100,
    body = body,
    body_2 = body_2,
    shape = shape,
    shape_2 = shape_2,
    fixture = fixture,
    fixture_2 = fixture_2
  }
  self.__index = self
  return setmetatable(newObj, self)
end

function Zilla:draw()
  love.graphics.setColor(255, 255, 255)
  --love.graphics.circle("fill", self.body.x, self.body.y, self.shape.getRadius, self.segments) -- Draw white circle with 100 segments.
  love.graphics.circle("fill", self.body:getX(), self.body:getY(), self.shape:getRadius())

  --love.graphics.circle("fill", self.body_2.x, self.body_2.y, self.shape.getRadius, self.segments) -- Draw white circle with 100 segments.
  love.graphics.circle("fill", self.body_2:getX(), self.body_2:getY(), self.shape:getRadius())
end

return Zilla
