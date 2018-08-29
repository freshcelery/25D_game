BASEDIR = love.filesystem.getRealDirectory("/packages"):match("(.-)[^%.]+$")
local myPath = BASEDIR..'/packages/?.lua;'..BASEDIR..'/packages/?/init.lua;'..BASEDIR..'/hitLogic/?.lua;'
local myPath2 = 'packages/?.lua;packages/?/init.lua;hitLogic/?.lua;'
package.path = myPath
love.filesystem.setRequirePath(myPath2)
local class = require 'class'
local score = class('score')

function score:__init()
    self.points = 0
end

function score:addScore(box, outline)
    local value = 0
    if box.x >= outline.x then
        value = box.x - outline.x
    else
        value = outline.x - box.x
    end

    if value == 0 then
        self.points = self.points + 100
    elseif value > 0 and value <= 20  or value < 0 and value >= -20 then
        self.points = self.points + 50
    elseif value > 20 then
        self.points = self.points - 100
    end
end

function score:decrementScore(value)
    self.points = self.points -  value
end
return score