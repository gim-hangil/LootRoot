-- Draw entity with image and position on the screen.
---@type fun(entity: Entity): nil
local drawSprite = System(
    { 'image', 'position' },
    function(image, position)
        love.graphics.draw(image, position.x, position.y, 0, LOOT_ROOT_SCALE)
    end
)

return {
    drawSprite = drawSprite,
}
