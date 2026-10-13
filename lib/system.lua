--[[The MIT License (MIT)

Copyright (c) 2015 airstruck

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
]]


local loadstring = _G.loadstring or _G.load
local tconcat = table.concat
local type = type

local function hasSigil (sigil, value)
    return type(value) == 'string' and sigil:byte() == value:byte()
end

return function (aspects, process)
    local args = {}
    local cond = {}
    local results = {}
    local localIndex = 0
    local choicePattern = '([^|]+)'

    local function suppress (aspect, condition)
        cond[#cond + 1] = 'if nil'
        for option in aspect:gmatch(choicePattern) do
            cond[#cond + 1] = condition:format(option)
        end
        cond[#cond + 1] = 'then return end'
    end

    local function supply (aspect, isOptional, isReturned)
        localIndex = localIndex + 1
        cond[#cond + 1] = ('local l%d = nil'):format(localIndex)
        for option in aspect:gmatch(choicePattern) do
            cond[#cond + 1] = ('or _entity[%q]'):format(option)
        end
        if not isOptional then
            cond[#cond + 1] = ('if not l%d then return end'):format(localIndex)
        end
        if isReturned then
            results[#results + 1] = ('_entity[%q]'):format(aspect)
        end
        args[#args + 1] = ('l%d'):format(localIndex)
    end

    for index = 1, #aspects do
        local aspect = aspects[index]
        if hasSigil('_', aspect) then
            args[#args + 1] = aspect
        elseif hasSigil('!', aspect) or hasSigil('~', aspect) then
            suppress(aspect:sub(2), 'or _entity[%q]')
        elseif hasSigil('-', aspect) then
            suppress(aspect:sub(2), 'or not _entity[%q]')
        elseif hasSigil('?', aspect) then
            supply(aspect:sub(2), true)
        elseif hasSigil('=', aspect) then
            supply(aspect:sub(2), false, true)
        else
            supply(aspect, false)
        end
    end

    local source = ([[
local _aspects, _process = ...
return function (_entity, ...) 
    %s
    %s _process(%s ...)
    return true
end]]):format(
        tconcat(cond, ' '),
        results[1] and (tconcat(results, ',') .. ' = ') or '',
        args[1] and (tconcat(args, ', ') .. ', ') or '')

    return loadstring(source)(aspects, process)
end
