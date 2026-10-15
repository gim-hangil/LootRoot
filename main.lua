function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")
    System = require("lib.system")
    Scene = require("src.scene")
    Entity = require("src.entity")
    BaseSystem = require("src.basesystem")
    Utils = require("src.utils")
    Title = require("src.title")
end

---@param dt number Time since the last update in seconds.
function love.update(dt)
    Title:update(dt)
end

function love.draw()
    love.graphics.scale(LOOT_ROOT_SCALE)
    love.graphics.clear(Utils.Colors.BLUE_GRAY)
    Title:draw()
end
