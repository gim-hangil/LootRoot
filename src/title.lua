---@class Title: Scene
local Title = Scene:new()
Title.entities = {
    Entity:new({
        text = 'Loot',
        font = love.graphics.newFont('assets/More 15.ttf', 32),
        position = { x = 0, y = 16 },
        color = Utils.Colors.RED,
        wrap = { limit = LOOT_ROOT_WIDTH / 2, align = 'right' },
    }),
    Entity:new({
        text = 'Root',
        font = love.graphics.newFont('assets/More 15.ttf', 32),
        position = { x = LOOT_ROOT_WIDTH / 2, y = 16 },
        wrap = { limit = LOOT_ROOT_WIDTH / 2, align = 'left' },
    }),
    Entity:new({
        text = 'Start',
        position = { x = 0, y = 64 },
        color = Utils.Colors.BLUE_GRAY,
        wrap = { limit = LOOT_ROOT_WIDTH, align = 'center' },
    }),
    Entity:new({
        text = 'How to',
        position = { x = 0, y = 80 },
        color = Utils.Colors.BLUE_GRAY,
        wrap = { limit = LOOT_ROOT_WIDTH, align = 'center' },
    }),
    Entity:new({
        text = 'Credit',
        position = { x = 0, y = 96 },
        color = Utils.Colors.BLUE_GRAY,
        wrap = { limit = LOOT_ROOT_WIDTH, align = 'center' },
    }),
}

function Title:draw()
    Scene.draw(self)
    for _, entity in ipairs(self.entities) do
        BaseSystem.renderText(entity)
    end
end

return Title
