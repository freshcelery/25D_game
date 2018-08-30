BASEDIR = love.filesystem.getRealDirectory("/src"):match("(.-)[^%.]+$")
local myPath = BASEDIR..'/packages/?.lua;'..BASEDIR..'/packages/?/init.lua;'..BASEDIR..'src/combat/?.lua;'..BASEDIR..'src/graphics/?.lua;'
local myPath2 = 'packages/?.lua;packages/?/init.lua;src/combat/?.lua;'
package.path = myPath
love.filesystem.setRequirePath(myPath2)

local Sprite = require 'sprite'
local CombatMechanic = require 'combatMechanic'

local sprite = Sprite.new()
local combatMechanic = CombatMechanic.new()

function love.load()
    sprite:create("assets/sprites/adventurer.png")
end

function love.update(dt)
    combatMechanic:update(dt)
end

function love.draw()
    -- sprite:draw()
    combatMechanic:draw()
end

function love.keypressed(key)
    combatMechanic:keypressed(key)
end