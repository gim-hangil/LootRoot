---@class Credits: Scene
---@field entities TextLabel[]
---@field private _credits { text: string, author: string }[]
local Credits = Scene:new()
Credits._credits = {
    { text = 'Game "LootRoot"', author = 'by Gim, Hangil' },
    { text = 'Font "More"', author = 'by somepx' },
    { text = 'Font "Yesterday"', author = 'by somepx' },
    { text = 'Palette "endesga 16"', author = 'by endesga' },
}

function Credits:new()
    local instance = setmetatable({
        entities = {
            TextLabel:new({
                text = 'Credits',
                position = { x = 0, y = 16 },
                font = love.graphics.newFont('assets/More 15.ttf', 32),
                wrap = { limit = LOOT_ROOT_WIDTH, align = 'center' },
            }),
        }
    }, { __index = Credits })
    for i, credit in ipairs(self._credits) do
        instance:addEntity(TextLabel:new({
            text = credit.text,
            position = { x = 8, y = 16 + i * 48 },
            color = Utils.Colors.LIGHT_GRAY,
            wrap = { limit = LOOT_ROOT_WIDTH - 16, align = 'left' },
        }))
        instance:addEntity(TextLabel:new({
            text = credit.author,
            position = { x = 8, y = 32 + i * 48 },
            color = Utils.Colors.BLUE_GRAY,
            wrap = { limit = LOOT_ROOT_WIDTH - 16, align = 'right' },
        }))
    end
    return instance
end

function Credits:update(dt)
    for _, entity in pairs(self.entities) do
        BaseSystem.rollingCredits(entity, dt)
    end
    if self.entities[#self.entities].position.y < -32 then
        local total_dy = LOOT_ROOT_HEIGHT - self.entities[1].position.y
        for _, entity in pairs(self.entities) do
            entity.position.y = entity.position.y + total_dy
        end
    end
end

function Credits:draw()
    for _, entity in pairs(self.entities) do
        BaseSystem.renderText(entity)
    end
end

function Credits:keypressed(key, scancode, isrepeat)
    if scancode == 'z' and not isrepeat then
        CurrentScene = Title:new()
    end
end

return Credits
