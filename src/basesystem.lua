-- Draw entity with image and position on the screen.
---@type fun(entity: Entity): nil
local drawSprite = System(
    { 'image', 'position' },
    function(image, position)
        love.graphics.draw(image, math.floor(position.x), math.floor(position.y))
    end
)

---@type love.Font Default font for drawing text.
local DEFAULT_FONT = love.graphics.newFont('assets/Yesterday 10.ttf', 16)

local renderText = System(
    { 'text', 'position', '?color', '?font', '?wrap' },
    function(text, position, color, font, wrap)
        color = color or Utils.Colors.WHITE
        font = font or DEFAULT_FONT
        wrap = wrap or { limit = 2 * LOOT_ROOT_WIDTH, align = 'left' }

        local current_color = { love.graphics.getColor() }
        love.graphics.setColor(color)
        love.graphics.setFont(font)
        love.graphics.printf(text, math.floor(position.x), math.floor(position.y), wrap.limit, wrap.align)
        love.graphics.setColor(current_color)
    end
)

---@type love.Font Default font for drawing buttons.
local DEFAULT_BUTTON_FONT = love.graphics.newFont('assets/Yesterday 10.ttf', 16)

-- Render a list of buttons with highlight on the selected button.
---@type fun(entity: Entity): nil
local renderButtons = System(
    { 'labels', 'position', 'value', '?color', '?active_color', '?font', '?wrap' },
    function(labels, position, value, color, active_color, font, wrap)
        color = color or Utils.Colors.BLUE_GRAY
        active_color = active_color or Utils.Colors.LIGHT_GRAY
        font = font or DEFAULT_BUTTON_FONT
        wrap = wrap or { limit = 2 * LOOT_ROOT_WIDTH, align = 'left' }

        love.graphics.setFont(font)
        for i, label in ipairs(labels) do
            local current_color = { love.graphics.getColor() }
            local y_offset = (i - 1) * (font:getHeight() + 4)
            local label_color = value == i and active_color or color
            love.graphics.setColor(label_color)
            love.graphics.printf(label, math.floor(position.x), math.floor(position.y + y_offset), wrap.limit, wrap.align)
            love.graphics.setColor(current_color)
        end
    end
)

---@type fun(entity: Entity, dt: number): nil
local rollingCredits = System(
    { 'position' },
    function (position, dt)
        position.y = position.y - 16 * dt
    end
)

return {
    drawSprite = drawSprite,
    renderText = renderText,
    renderButtons = renderButtons,
    rollingCredits = rollingCredits,
}
