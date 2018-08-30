BASEDIR = love.filesystem.getRealDirectory("/packages"):match("(.-)[^%.]+$")
local myPath = BASEDIR..'/packages/?.lua;'..BASEDIR..'/packages/?/init.lua;'..BASEDIR..'src/combat/?.lua;'..BASEDIR..'src/graphics/?.lua;'
local myPath2 = 'packages/?.lua;packages/?/init.lua;src/combat/?.lua;'
package.path = myPath
love.filesystem.setRequirePath(myPath2)

local class = require 'class'
local Box = require 'box'
local Outline = require 'outline'
local Score = require 'score'
local StartPoints = require 'startPoints'
local Controls = require 'controls'
local combatMechanic = class('combatMechanic')

function combatMechanic:__init()
    self.success = true
    self.random = StartPoints.new()
    self.random:randomize()
    self.box = Box.new(self.random.x, self.random.y)
    self.outline = Outline.new(self.random.x, self.random.y, self.box)
    self.score = Score.new()
    self.controls = Controls.new()
    self.points = tostring(self.score.points)
end

function combatMechanic:update(dt)
    self.success = self.outline:update(dt, self.box)

    -- if user fails to keypress in time, do stuff
    if self.success == false then
        self.success = true
        self.score:decrementScore(100)
        self.points = tostring(self.score.points)
        self.random:randomize()
        self.box:reset(self.random.x, self.random.y)
        self.outline:reset(self.random.x, self.random.y, self.box)
    end
end

function combatMechanic:keypressed(key)
    self.controls:keypressed(key, self.score, self.random, self.box, self.outline)
    self.points = tostring(self.score.points)
end

function combatMechanic:draw()
    love.graphics.print(self.points)
    self.box:draw()
    self.outline:draw(self.box)
end

return combatMechanic