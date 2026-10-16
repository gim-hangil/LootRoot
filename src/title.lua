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
        labels = { 'Start', 'How to', 'Credits' },
        position = { x = 0, y = 64 },
        value = 1,
        wrap = { limit = LOOT_ROOT_WIDTH, align = 'center' },
    }),
}

function Title:draw()
    Scene.draw(self)
    for _, entity in ipairs(self.entities) do
        BaseSystem.renderText(entity)
        BaseSystem.renderButtons(entity)
    end
end

return Title
