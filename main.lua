function love.load()
  alpha = 0
  alphaIncrementer = 1
end

function love.update()
  if alpha == 255 then
    alphaIncrementer = -1
  elseif alpha == 0 then
    alphaIncrementer = 1
  end

  alpha = alpha + 5 * alphaIncrementer
end

function love.draw()
  love.graphics.setColor(102, 20, 99, 255)
  love.graphics.print(alpha, 20, 20)

  love.graphics.setColor(102, 20, 99, alpha)
  love.graphics.print("ZillaZillo", 400, 300)
end
