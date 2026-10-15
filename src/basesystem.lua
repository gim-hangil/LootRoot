-- Draw entity with image and position on the screen.
---@type fun(entity: Entity): nil
local drawSprite = System(
    { 'image', 'position' },
    function(image, position)
        love.graphics.draw(image, position.x, position.y)
    end
)

local DEFAULT_FONT = love.graphics.newFont('assets/BoldPixels.ttf', 16)
local renderText = System(
    { 'text', 'color', 'position', '?font', '?wrap' },
    function(text, color, position, font, wrap)
        local current_color = { love.graphics.getColor() }
        love.graphics.setFont(font or DEFAULT_FONT)
        love.graphics.setColor(color)
        love.graphics.printf(text, position.x, position.y, wrap.limit, wrap.align)
        love.graphics.setColor(current_color)
    end
)

return {
    drawSprite = drawSprite,
    renderText = renderText,
}
