Zilla = {}

function Zilla:new(world, x, y)
  body = love.physics.newBody(world, x, y, "dynamic")
  shape = love.physics.newCircleShape(40)
  fixture = love.physics.newFixture(body, shape, 1)
  fixture:setRestitution(0)

  newObj = {
    x = x,
    y = y,
    segments = 100,
    body = body,
    shape = shape,
    fixture = fixture
  }
  self.__index = self
  return setmetatable(newObj, self)
end

function Zilla:draw()
  love.graphics.setColor(255, 255, 255)
  --love.graphics.circle("fill", self.body.x, self.body.y, self.shape.getRadius, self.segments) -- Draw white circle with 100 segments.
  love.graphics.circle("fill", self.body:getX(), self.body:getY(), self.shape:getRadius())
end

return Zilla