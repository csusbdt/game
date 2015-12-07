local camera_mt = {}
camera_mt.__index = camera_mt

function camera_mt:lookat(x, y)
	self.x = x
	self.y = y
	if self.x < self.min_x then self.x = self.min_x end
	if self.x > self.max_x then self.x = self.max_x end
	if self.y < self.min_y then self.y = self.min_y end
	if self.y > self.max_y then self.y = self.max_y end
end

function camera_mt:screen(x, y)
	return x - self.x + self.window_half_width, y - self.y + self.window_half_height
end

local function create(world_width, world_height)
	if world_height == nil then error("camera constructor called without world height argument") end
	local o = {}
	setmetatable(o, camera_mt)
	o.window_half_width  = window_width  / 2
	o.window_half_height = window_height / 2
	o.x     = o.window_half_width
	o.y     = o.window_half_height
	o.min_x = o.window_half_width
	o.min_y = o.window_half_height
	o.max_x = world_width  - o.window_half_width 
	o.max_y = world_height - o.window_half_height
	return o
end

return {
	create = create
}

