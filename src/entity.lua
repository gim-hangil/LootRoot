-- Entity base class.
---@class Entity
---@field id number
---@field private _id number
local Entity = {}
Entity._id = 0

---@param o? table
function Entity:new(o)
    self._id = self._id + 1

    local instance = setmetatable(o or {}, { __index = Entity })
    instance.id = self._id
    instance.__index = self

    return instance
end

-- Compare two Entity by its id.
---@param a Entity
---@param b Entity
function Entity.__eq(a, b)
    return a.id == b.id
end

return Entity
