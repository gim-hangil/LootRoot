LOOT_ROOT_SCALE = 3
LOOT_ROOT_WIDTH = 160
LOOT_ROOT_HEIGHT = 144


function love.conf(t)
    t.version = "11.5"
    t.window.title = "LootRoot"
    t.window.icon = nil
    t.window.width = LOOT_ROOT_WIDTH * LOOT_ROOT_SCALE
    t.window.height = LOOT_ROOT_HEIGHT * LOOT_ROOT_SCALE
    t.window.borderless = false
    t.window.resizable = false
    t.window.minwidth = LOOT_ROOT_WIDTH
    t.window.minheight = LOOT_ROOT_HEIGHT
    t.window.fullscreen = false
    t.window.fullscreentype = "desktop"

    t.modules.audio = true
    t.modules.data = true
    t.modules.event = true
    t.modules.font = true
    t.modules.graphics = true
    t.modules.image = true
    t.modules.joystick = true
    t.modules.keyboard = true
    t.modules.math = true
    t.modules.mouse = true
    t.modules.physics = true
    t.modules.sound = true
    t.modules.system = true
    t.modules.thread = true
    t.modules.timer = true
    t.modules.touch = true
    t.modules.video = true
    t.modules.window = true
end
