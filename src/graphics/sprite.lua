BASEDIR = love.filesystem.getRealDirectory("/packages"):match("(.-)[^%.]+$")
local myPath = BASEDIR..'/packages/?.lua;'..BASEDIR..'/packages/?/init.lua;'..BASEDIR..'src/combat/?.lua;'..BASEDIR..'src/graphics/?.lua;'
local myPath2 = 'packages/?.lua;packages/?/init.lua;src/combat/?.lua;'
package.path = myPath
love.filesystem.setRequirePath(myPath2)

local class = require 'class'
local sprite = class('sprite')

function sprite:__init()
    self.sprite = {}
    self.sprite.x = 50
    self.sprite.y = 50
end

function sprite:draw()
    love.graphics.setColor(255,255,255)
    love.graphics.draw(
        self.sprite.image,
        self.sprite.x,
        self.sprite.y,
        0,
        10,
        10
    )
end

function sprite:create(imagePath)
    self.sprite.image = love.graphics.newImage(imagePath)
    self.sprite.image:setFilter('nearest', 'nearest')
end

return sprite