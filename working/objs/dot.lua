local textures  = require('res.textures')
local af        = require('util.anim_factory')
local camera    = require('util.camera')

local s = textures.image('objs/dot.png')

local idle = af.create({
	{ s = s, x =   0, y =   0, w = 64, h = 64, t = 8 },
	{ s = s, x =  64, y =   0, w = 64, h = 64, t = 8 },
	{ s = s, x = 128, y =   0, w = 64, h = 64, t = 8 },
	{ s = s, x = 192, y =   0, w = 64, h = 64, t = 8 },
	{ s = s, x = 128, y =   0, w = 64, h = 64, t = 8 }
})

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

