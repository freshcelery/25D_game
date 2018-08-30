BASEDIR = love.filesystem.getRealDirectory("/packages"):match("(.-)[^%.]+$")
local myPath = BASEDIR..'/packages/?.lua;'..BASEDIR..'/packages/?/init.lua;'..BASEDIR..'src/combat/?.lua;'..BASEDIR..'src/graphics/?.lua;'
local myPath2 = 'packages/?.lua;packages/?/init.lua;src/combat/?.lua;'
package.path = myPath
love.filesystem.setRequirePath(myPath2)

local class = require 'class'
local controls = class('controls')

function controls:__init()
end

function controls:keypressed(key, score, random, box, outline)
    if key == "space" then
        score:addScore(box, outline)
        random:randomize()
        box:reset(random.x, random.y)
        outline:reset(random.x, random.y, box)
    end
end

return controls