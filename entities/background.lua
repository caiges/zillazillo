Background = {}

function Background:new(x, y, params)
  newObj = {
    x = x,
    y = y,
    size = params.size,
    colors = params.colors,
    alpha = params.alpha,
    fillColor = params.fill.color,
    fillAlpha = params.fill.alpha,
    fill = params.fill,
    maxWidth = params.maxWidth,
    maxHeight = params.maxHeight
  }
  self.__index = self
  return setmetatable(newObj, self)
end

function Background:draw()
  local rows = 0
  while rows * self.size < self.maxHeight do
    local columns = 0

    while columns * self.size < self.maxWidth do
      local xOffset = 0
      local yOffset = 0

      if columns - 1 ~= -1 then
        xOffset = columns * self.size
      end

      if rows - 1 ~= -1 then
        yOffset = rows * self.size
      end

      -- Draw box
      local color = self.colors[math.random(#self.colors)]
      love.graphics.setColor(color.red, color.green, color.blue)
      love.graphics.rectangle('fill', xOffset, yOffset, self.size, self.size)
      -- Increment column counter
      columns = columns + 1
    end
    rows = rows + 1
  end
end

return Background