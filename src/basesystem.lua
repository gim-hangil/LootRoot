-- Draw entity with image and position on the screen.
---@type fun(entity: Entity): nil
local drawSprite = System(
    { 'image', 'position' },
    function(image, position)
        love.graphics.draw(image, position.x, position.y)
    end
)

local DEFAULT_COLOR = Utils.Colors.WHITE
local DEFAULT_FONT = love.graphics.newFont('assets/Yesterday 10.ttf', 16)
local renderText = System(
    { 'text', 'position', '?color', '?font', '?wrap' },
    function(text, position, color, font, wrap)
        local current_color = { love.graphics.getColor() }
        love.graphics.setColor(color or DEFAULT_COLOR)
        love.graphics.setFont(font or DEFAULT_FONT)
        love.graphics.printf(text, position.x, position.y, wrap.limit, wrap.align)
        love.graphics.setColor(current_color)
    end
)

return {
    drawSprite = drawSprite,
    renderText = renderText,
}
