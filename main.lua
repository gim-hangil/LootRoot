function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")
    System = require("lib.system")
    Scene = require("src.scene")
    Entity = require("src.entity")
    Title = require("src.title")
end

---@param dt number Time since the last update in seconds.
function love.update(dt)
    Title:update(dt)
end

function love.draw()
    Title:draw()
end
