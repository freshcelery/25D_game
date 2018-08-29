
BASEDIR = love.filesystem.getRealDirectory("/packages"):match("(.-)[^%.]+$")
local myPath = BASEDIR..'/packages/?.lua;'..BASEDIR..'/packages/?/init.lua;'..BASEDIR..'/hitLogic/?.lua;'
local myPath2 = 'packages/?.lua;packages/?/init.lua;hitLogic/?.lua;'
package.path = myPath
love.filesystem.setRequirePath(myPath2)

local class = require 'class'
local Box = require 'box'
local Outline = require 'outline'
local Score = require 'score'
local startPoints = require 'startPoints'

local success = true

local random = startPoints()
random:randomize()
local box = Box.new(random.x, random.y)
local outline = Outline.new(random.x, random.y, box)
local score = Score.new()
local points = tostring(score.points)

function love.update(dt)
    success = outline:update(dt, box)

    -- if user fails to keypress in time, do stuff
    if success == false then
        success = true
        score:decrementScore(100)
        points = tostring(score.points)
        random:randomize()
        box:setCoords(random.x, random.y)
        outline:setCoords(random.x, random.y, box)
    end
end

function love.draw()
    love.graphics.print(points)
    box:draw()
    outline:draw(box)
end

function love.keypressed(key)
    if key == "space" then
        score:addScore(box, outline)
        points = tostring(score.points)
        random:randomize()
        box:setCoords(random.x, random.y)
        outline:setCoords(random.x, random.y, box)
    end
end