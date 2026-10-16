---@type Scene
CurrentScene = nil

function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")
    System = require("lib.system")
    Scene = require("src.scene")
    Entity = require("src.entity")
    Utils = require("src.utils")
    BaseSystem = require("src.basesystem")
    TextLabel = require("src.textlabel")
    ButtonList = require("src.buttonlist")
    Title = require("src.title")
    Credits = require("src.credits")

    CurrentScene = Title:new()
end

---@param dt number Time since the last update in seconds.
function love.update(dt)
    CurrentScene:update(dt)
end

function love.draw()
    love.graphics.scale(LOOT_ROOT_SCALE)
    love.graphics.clear(Utils.Colors.DARK_BROWN)
    CurrentScene:draw()
end

-- Callback function triggered when a key is pressed.
---@param key love.KeyConstant Character of the pressed key.
---@param scancode love.Scancode The scancode representing the pressed key.
---@param isrepeat boolean Whether this keypress event is a repeat. The delay between key repeats depends on the user's system settings.
function love.keypressed(key, scancode, isrepeat)
    CurrentScene:keypressed(key, scancode, isrepeat)
end

-- Callback function triggered when a keyboard key is released.
---@param key love.KeyConstant Character of the released key.
---@param scancode love.Scancode The scancode representing the released key.
function love.keyreleased(key, scancode)
    CurrentScene:keyreleased(key, scancode)
end
