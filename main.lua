---@type Scene
local scene

function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")
    System = require("lib.system")
    Scene = require("src.scene")
    Entity = require("src.entity")
    Utils = require("src.utils")
    BaseSystem = require("src.basesystem")
    Title = require("src.title")
    Credits = require("src.credits")

    scene = Title
end

---@param dt number Time since the last update in seconds.
function love.update(dt)
    scene:update(dt)
    scene = scene.next_scene
    scene.next_scene = scene
end

function love.draw()
    love.graphics.scale(LOOT_ROOT_SCALE)
    love.graphics.clear(Utils.Colors.DARK_BROWN)
    scene:draw()
end

-- Callback function triggered when a key is pressed.
---@param key love.KeyConstant Character of the pressed key.
---@param scancode love.Scancode The scancode representing the pressed key.
---@param isrepeat boolean Whether this keypress event is a repeat. The delay between key repeats depends on the user's system settings.
function love.keypressed(key, scancode, isrepeat)
    scene:keypressed(key, scancode, isrepeat)
end

-- Callback function triggered when a keyboard key is released.
---@param key love.KeyConstant Character of the released key.
---@param scancode love.Scancode The scancode representing the released key.
function love.keyreleased(key, scancode)
    scene:keyreleased(key, scancode)
end
