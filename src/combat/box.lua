BASEDIR = love.filesystem.getRealDirectory("/packages"):match("(.-)[^%.]+$")
local myPath = BASEDIR..'/packages/?.lua;'..BASEDIR..'/packages/?/init.lua;'..BASEDIR..'src/combat/?.lua;'..BASEDIR..'src/graphics/?.lua;'
local myPath2 = 'packages/?.lua;packages/?/init.lua;src/combat/?.lua;'
package.path = myPath
love.filesystem.setRequirePath(myPath2)

local class = require 'class'
local box = class('box')

function box:__init(x, y)
    self.width = 75
    self.height = 75
    self.x = x 
    self.y = y 
end

function box:reset(x, y)
    self:__init(x, y)
end

function box:getX()
    return self.x
end

function box:draw()
    love.graphics.setColor(1, 0, 0)
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

function box:update()
    self.x = self.x + 5
    if self.x > love.graphics.getWidth() then
        self.x = 0
    end
end

return box