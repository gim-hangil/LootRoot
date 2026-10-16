---@class Credits: Scene
local Credits = Scene:new()
Credits.entities = {
    Entity:new({
        text = 'Credits',
        font = love.graphics.newFont('assets/More 15.ttf', 32),
        position = { x = 0, y = 16 },
        wrap = { limit = LOOT_ROOT_WIDTH, align = 'center' },
    }),
    Entity:new({
        text = 'Game by Gim, Hangil',
        position = { x = 8, y = 64 },
        color = Utils.Colors.LIGHT_GRAY,
        wrap = { limit = LOOT_ROOT_WIDTH - 16, align = 'left' },
    }),
    Entity:new({
        text = 'Font "More" by somepx',
        position = { x = 8, y = 96 },
        color = Utils.Colors.LIGHT_GRAY,
        wrap = { limit = LOOT_ROOT_WIDTH - 16, align = 'left' },
    }),
    Entity:new({
        text = 'Font "Yesterday" by somepx',
        position = { x = 8, y = 128 },
        color = Utils.Colors.LIGHT_GRAY,
        wrap = { limit = LOOT_ROOT_WIDTH - 16, align = 'left' },
    }),
    Entity:new({
        text = 'Palette "endesga 16" by endesga',
        position = { x = 8, y = 160 },
        color = Utils.Colors.LIGHT_GRAY,
        wrap = { limit = LOOT_ROOT_WIDTH - 16, align = 'left' },
    }),
}

function Credits:update(dt)
    for _, entity in pairs(self.entities) do
        BaseSystem.rollingCredits(entity, 0, -16, dt)
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
        self.next_scene = Title
    end
end

return Credits
