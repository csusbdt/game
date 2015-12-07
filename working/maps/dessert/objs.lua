local textures = require('res.textures')

local object_mt = {
	x  = 100,
	y  = 100,
	t  = textures.image('maps/dessert/objs.png')
}
object_mt.__index = object_mt

function object_mt:draw(camera)
	local x, y = camera:screen(self.x, self.y)
	self.t:draw(self.tx, self.ty, self.tw, self.th, x - self.tw / 2, y - self.th / 2)
end

local function create_bolder1(o)
	o = o or {}
	o.tx = 0
	o.ty = 23
	o.tw = 136
	o.th = 110
	setmetatable(o, object_mt)
	return o
end

local function create_bolder2(o)
	o = o or {}
	o.tx = 0
	o.ty = 199
	o.tw = 136
	o.th = 63
	setmetatable(o, object_mt)
	return o
end

local function create_bolder3(o)
	o = o or {}
	o.tx = 0
	o.ty = 320
	o.tw = 269
	o.th = 206
	setmetatable(o, object_mt)
	return o
end

local function create_bolder4(o)
	o = o or {}
	o.tx = 267
	o.ty = 412
	o.tw = 250
	o.th = 111
	setmetatable(o, object_mt)
	return o
end

local function create_cactus1(o)
	o = o or {}
	o.tx = 140
	o.ty = 156
	o.tw = 105
	o.th = 107
	setmetatable(o, object_mt)
	return o
end

local function create_cactus2(o)
	o = o or {}
	o.tx = 150
	o.ty = 84
	o.tw = 92
	o.th = 49
	setmetatable(o, object_mt)
	return o
end

local function create_shrub1(o)
	o = o or {}
	o.tx = 268
	o.ty = 345
	o.tw = 103
	o.th = 48
	setmetatable(o, object_mt)
	return o
end

return {
	create_bolder1 = create_bolder1,
	create_bolder2 = create_bolder2,
	create_bolder3 = create_bolder3,
	create_bolder4 = create_bolder4,
	create_cactus1 = create_cactus1,
	create_cactus2 = create_cactus2,
	create_shrub1  = create_shrub1,
}

