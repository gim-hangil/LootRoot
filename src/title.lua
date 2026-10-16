---@class Title: Scene
---@field entities { title_loot: TextLabel, title_root: TextLabel, buttons: ButtonList, help: TextLabel }
local Title = Scene:new()

function Title:new()
    local instance = setmetatable({
        entities = {
            title_loot = TextLabel:new({
                text = 'Loot',
                font = love.graphics.newFont('assets/More 15.ttf', 32),
                position = { x = 0, y = 16 },
                color = Utils.Colors.RED,
                wrap = { limit = LOOT_ROOT_WIDTH / 2, align = 'right' },
            }),
            title_root = TextLabel:new({
                text = 'Root',
                font = love.graphics.newFont('assets/More 15.ttf', 32),
                position = { x = LOOT_ROOT_WIDTH / 2, y = 16 },
                wrap = { limit = LOOT_ROOT_WIDTH / 2, align = 'left' },
            }),
            buttons = ButtonList:new({
                labels = { 'Start', 'How to', 'Credits' },
                position = { x = 0, y = 56 },
            }),
            help = TextLabel:new({
                text = 'Use z, x and arrow keys.',
                position = { x = 0, y = LOOT_ROOT_HEIGHT - 18 },
                color = Utils.Colors.BLUE_GRAY,
            }),
        },
    }, { __index = Title })
    return instance
end

function Title:draw()
    Scene.draw(self)
    for _, entity in pairs(self.entities) do
        BaseSystem.renderText(entity)
        BaseSystem.renderButtons(entity)
    end
end

-- Callback function triggered when a key is pressed.
---@param key love.KeyConstant Character of the pressed key.
---@param scancode love.Scancode The scancode representing the pressed key.
---@param isrepeat boolean Whether this keypress event is a repeat. The delay between key repeats depends on the user's system settings.
function Title:keypressed(key, scancode, isrepeat)
    if scancode == 'up' then
        self.entities.buttons.value = math.max(1, self.entities.buttons.value - 1)
    elseif scancode == 'down' then
        self.entities.buttons.value = math.min(#self.entities.buttons.labels, self.entities.buttons.value + 1)
    elseif scancode == 'z' then
        if self.entities.buttons.value == 1 then
        elseif self.entities.buttons.value == 2 then
        elseif self.entities.buttons.value == 3 then
            CurrentScene = Credits:new()
        end
    end
end

return Title
