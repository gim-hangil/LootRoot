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

function Scene:draw()
    for _, entity in ipairs(self.entities) do
        BaseSystem.drawSprite(entity)
    end
end

return Scene
