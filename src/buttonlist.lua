---@class ButtonList: Entity
---@field labels string[] The labels of the buttons.
---@field position { x: number, y: number } The position of the button list.
---@field value number The currently selected button index.
---@field color number[] The color of the buttons.
---@field active_color number[] The color of the active button.
---@field font love.Font The font of the buttons.
---@field wrap { limit: number, align: string } The line wrap settings for the buttons.
local ButtonList = Entity:new()

---@param o { labels: string[], position: { x: number, y: number }, value: number?, color: number[]?, active_color: number[]?, font: love.Font?, wrap: { limit: number, align: string }? }
function ButtonList:new(o)
    o.value = o.value or 1
    o.color = o.color or Utils.Colors.BLUE_GRAY
    o.active_color = o.active_color or Utils.Colors.LIGHT_GRAY
    o.font = o.font or BaseSystem.DEFAULT_FONT
    o.wrap = o.wrap or { limit = LOOT_ROOT_WIDTH, align = 'center' }
    local instance = setmetatable({
        labels = o.labels,
        position = o.position,
        value = o.value,
        color = o.color,
        active_color = o.active_color,
        font = o.font,
        wrap = o.wrap,
    }, { __index = ButtonList })
    return instance
end

return ButtonList
