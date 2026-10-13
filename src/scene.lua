-- Scene base class
---@class Scene
---@field entities Entity[]
local Scene = {}

function Scene:new()
    local instance = setmetatable({
        entities = {},
    }, { __index = Scene })
    instance.__index = self
    return instance
end

---@param entity Entity
function Scene:addEntity(entity)
    table.insert(self.entities, entity)
end

---@param dt number Time since the last update in seconds.
function Scene:update(dt)
end

-- Draw entity with image and position on the screen.
---@type fun(entity: Entity): nil
local drawSprite = System(
    { 'image', 'position' },
    function(image, position)
        love.graphics.draw(image, position.x, position.y, 0, LOOT_ROOT_SCALE)
    end
)

function Scene:draw()
    for _, entity in ipairs(self.entities) do
        drawSprite(entity)
    end
end

return Scene
