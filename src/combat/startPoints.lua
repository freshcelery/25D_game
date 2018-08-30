BASEDIR = love.filesystem.getRealDirectory("/packages"):match("(.-)[^%.]+$")
local myPath = BASEDIR..'/packages/?.lua;'..BASEDIR..'/packages/?/init.lua;'..BASEDIR..'src/combat/?.lua;'..BASEDIR..'src/graphics/?.lua;'
local myPath2 = 'packages/?.lua;packages/?/init.lua;src/combat/?.lua;'
package.path = myPath
love.filesystem.setRequirePath(myPath2)

local class = require 'class'
local startPoints = class('startPoints')

function startPoints:__init()
    self.x = 0
    self.y = 0
end

function startPoints:randomize()
    math.randomseed(os.time())
    self.x = math.random(500)
    self.y = math.random(500)
end

return startPoints