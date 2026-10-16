-- Scene base class
---@class Scene
---@field entities Entity[]
local Scene = {}

function Scene:new()
    local instance = setmetatable({
        entities = {},
    }, { __index = Scene })
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
    for _, entity in pairs(self.entities) do
        BaseSystem.drawSprite(entity)
    end
end

-- Callback function triggered when a key is pressed.
---@param key love.KeyConstant Character of the pressed key.
---@param scancode love.Scancode The scancode representing the pressed key.
---@param isrepeat boolean Whether this keypress event is a repeat. The delay between key repeats depends on the user's system settings.
function Scene:keypressed(key, scancode, isrepeat)
end

-- Callback function triggered when a keyboard key is released.
---@param key love.KeyConstant Character of the released key.
---@param scancode love.Scancode The scancode representing the released key.
function Scene:keyreleased(key, scancode)
end

return Scene
