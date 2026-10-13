---@class Title: Scene
local Title = Scene:new()
Title.entities = {
    Entity:new({
        image = love.graphics.newImage('assets/title_bg.png'),
        position = { x = 0, y = 0 },
    }),
}

return Title
