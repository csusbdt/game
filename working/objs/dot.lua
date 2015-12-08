local textures  = require('res.textures')
local anim      = require('eng.anim')
local camera    = require('eng.camera')

local sprite = textures.image('objs/dot.png')

local idle = anim.create()
idle:addframe{ sprite = sprite }
idle:addframe{ sprite = sprite, x =  64, t = 8 }
idle:addframe{ sprite = sprite, x = 128, t = 8 }
idle:addframe{ sprite = sprite, x = 192, t = 8 }
idle:addframe{ sprite = sprite, x = 128, t = 8 }
local anim = idle

local dot_mt = {
	x = 100,
	y = 100
}
dot_mt.__index = dot_mt

function dot_mt:draw()
	local x, y = camera.screen(self.x, self.y)
	self.loop(x, y)
end

local function create(o)
	local o = o or {}
	setmetatable(o, dot_mt)
	o.loop = idle:loop()
	return o
end

return {
	create = create
}

