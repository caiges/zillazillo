local Zilla = require('entities/zilla')

function love.load()
  alpha = 0
  alphaIncrementer = 1
  alphaMultiplier = 3

  love.physics.setMeter(64) --the height of a meter our worlds will be 64px
  world = love.physics.newWorld(0, 0, true)
  love.window.setMode(650, 650)
  -- Background
  love.graphics.setBackgroundColor(194, 210, 174)

  zilla = Zilla:new(world, 200, 200)
end

function love.update(dt)
  world:update(dt)

  if alpha == 255 then
    alphaIncrementer = -1
  elseif alpha == 0 then
    alphaIncrementer = 1
  end

  alpha = alpha + alphaMultiplier * alphaIncrementer

  if love.keyboard.isDown("d") then --press the right arrow key to push the ball to the right
    zilla.body:applyForce(400, 0)
  end
  if love.keyboard.isDown("a") then --press the left arrow key to push the ball to the left
    zilla.body:applyForce(-400, 0)
  end
  if love.keyboard.isDown("w") then --press the up arrow key to set the ball in the air
    zilla.body:applyForce(0, -400)
  end
  if love.keyboard.isDown("s") then
    zilla.body:applyForce(0, 400)
  end

end

function love.draw()
  love.graphics.setColor(102, 20, 99, 255)
  love.graphics.print(alpha, 20, 20)

  love.graphics.setColor(220, 6, 217, alpha)
  love.graphics.print("ZillaZillo", 300, 300, 0, 1.5, 1.5)

  zilla:draw()
end
