---@class Title: Scene
local Title = Scene:new()
Title.entities = {
    Entity:new({
        image = love.graphics.newImage('assets/title.png'),
        position = { x = 0, y = 0 },
    }),
    Entity:new({
        text = 'Start',
        position = { x = 0, y = 44 },
        wrap = { limit = LOOT_ROOT_WIDTH, align = 'center' },
    }),
    Entity:new({
        text = 'Credit',
        position = { x = 0, y = 60 },
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
