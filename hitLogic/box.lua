BASEDIR = love.filesystem.getRealDirectory("/packages"):match("(.-)[^%.]+$")
local myPath = BASEDIR..'/packages/?.lua;'..BASEDIR..'/packages/?/init.lua;'..BASEDIR..'/hitLogic/?.lua;'
local myPath2 = 'packages/?.lua;packages/?/init.lua;hitLogic/?.lua;'
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

function box:setCoords(x, y)
    self.x = x
    self.y = y
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