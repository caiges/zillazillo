local Zilla = require('entities/zilla')
local Background = require('entities/background')

math.randomseed(os.time())

function love.load()
  alpha = 0
  alphaIncrementer = 1
  alphaMultiplier = 3
  -- dx = 0
  -- dy = 0
  -- dist = 0
  -- inv = 0
  love.physics.setMeter(64) --the height of a meter our worlds will be 64px
  world = love.physics.newWorld(0, 0, true)
  love.window.setMode(650, 650)
  -- Background
  --love.graphics.setBackgroundColor(194, 210, 174)

  background = Background:new(0, 0, {
    size = 50,
    colors = {
      {
        red = 22,
        green = 66,
        blue = 194
      },
      {
        red = 31,
        green = 29,
        blue = 43
      },
      {
        red = 14,
        green = 27,
        blue = 10
      }
    },
    alpha = 1,
    fill = {
      color = {
        red = 28,
        green = 27,
        blue = 41
      },
      alpha = 1
    },
    maxHeight = 650,
    maxWidth = 650
  })

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

  dx = zilla.body:getX() - zilla.body_2:getX()
  dy = zilla.body:getY() - zilla.body_2:getY()
  dist = math.sqrt(dx * dx + dy * dy)

  zilla.body_2:applyForce(dx * 4 / dist, dy * 4 / dist)
end

function love.draw()
  love.graphics.setColor(102, 20, 99, 255)
  love.graphics.print(alpha, 20, 20)

  love.graphics.setColor(220, 6, 217, alpha)
  love.graphics.print("ZillaZillo", 300, 200, 0, 1.5, 1.5)

  background:draw()
  zilla:draw()
end
