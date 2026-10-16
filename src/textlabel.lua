---@class TextLabel: Entity
---@field text string The text to display.
---@field position { x: number, y: number } The position of the text label.
---@field color number[] The color of the text label.
---@field font love.Font The font of the text label.
---@field wrap { limit: number, align: string } The wrapping settings for the text label
local TextLabel = Entity:new()

---@param o { text: string, position: { x: number, y: number }, color: number[]?, font: love.Font?, wrap: { limit: number, align: string }? }
function TextLabel:new(o)
    o.color = o.color or Utils.Colors.WHITE
    o.font = o.font or BaseSystem.DEFAULT_FONT
    o.wrap = o.wrap or { limit = LOOT_ROOT_WIDTH, align = 'center' }
    local instance = setmetatable({
            text = o.text,
            position = o.position,
            color = o.color,
            font = o.font,
            wrap = o.wrap,
    }, { __index = TextLabel })
    return instance
end

return TextLabel
