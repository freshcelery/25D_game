BASEDIR = love.filesystem.getRealDirectory("/packages"):match("(.-)[^%.]+$")
local myPath = BASEDIR..'/packages/?.lua;'..BASEDIR..'/packages/?/init.lua;'..BASEDIR..'src/combat/?.lua;'..BASEDIR..'src/graphics/?.lua;'
local myPath2 = 'packages/?.lua;packages/?/init.lua;src/combat/?.lua;'
package.path = myPath
love.filesystem.setRequirePath(myPath2)

local class = require 'class'
local outline = class('outline')

function outline:__init(x, y, box)
    self.sizeMultiplier = 10
    self.startX = x - ((box.width/2) * (self.sizeMultiplier -1))
    self.startY = y - ((box.height/2) * (self.sizeMultiplier -1))
    self.x = self.startX
    self.y = self.startY
    self.width = box.width * self.sizeMultiplier 
    self.height = box.height * self.sizeMultiplier
    self.angle = 0
    self.speed = (25 * (self.sizeMultiplier -1))
    self.tx = self.x + self.width * 0.5
    self.ty = self.y + self.height * 0.5
end

function outline:reset(x, y, box)
    self:__init(x, y, box)
end

function outline:draw(box)
    love.graphics.setColor(0, 0, 1)
    love.graphics.translate(self.tx, self.ty)   -- rotation center
	love.graphics.rotate(self.angle)         -- rotate
	love.graphics.translate(-self.tx, -self.ty) -- move back
    love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
end

function outline:update(dt, box)
    if self.width <= box.width - (10) then
        return false
    else
        self:rotate(dt)
        self.width = self.width - ((dt * self.speed) * 2)
        self.height = self.height - ((dt * self.speed) * 2)
        self.x = self.x + (dt * self.speed)
        self.y = self.y + (dt * self.speed)
    end
end

function outline:rotate(dt)
    local target = (math.pi * self.sizeMultiplier)/2
    local difference = target - self.angle
    local rate = math.pi
    local change = rate * dt
    if difference == 0 then
        return
    end

    if difference > 0 then
        change = math.min(change, difference)
    end
    
    self.angle = self.angle + change
end

return outline