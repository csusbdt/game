local camera   = require('eng.camera')

local tiler_mt = {
}
tiler_mt.__index = tiler_mt;

function tiler_mt:draw()
	local w = self.t.w
	local h = self.t.h
	-- Compute coordinates of upper left corners of 
	-- the tile containing the camera and its 8 neighbors.
	local x2 = math.modf(camera.x / w) * w
	local x1 = x2 - w
	local x3 = x2 + w
	local y2 = math.modf(camera.y / h) * h
	local y1 = y2 - h
	local y3 = y2 + h

	local dx = w / 2 - (camera.x % w)
	local dy = h / 2 - (camera.y % h)


	-- row 1
	if x1 > -w         and y1 > -h         then self.t:draw(dx - w, dy - h)  end
	if                     y1 > -h         then self.t:draw(dx    , dy - h)  end
	if x3 < self.map_w and y1 > -h         then self.t:draw(dx + w, dy - h)  end

	-- row 2
	if x1 > -w                             then self.t:draw(dx - w, dy    )  end
	                                            self.t:draw(dx    , dy    )
	if x3 < self.map_w                     then self.t:draw(dx + w, dy    )  end

	-- row 3
	if x1 > -w         and y3 < self.map_h then self.t:draw(dx - w, dy + h)  end
	if                     y3 < self.map_h then self.t:draw(dx    , dy + h)  end
	if x3 < self.map_w and y3 < self.map_h then self.t:draw(dx + w, dy + h)  end
end


local function create(texture, rows, columns) 
	local tiler = {
		t = texture,
		r = rows,
		c = columns,
		map_w = texture.w * columns,
		map_h = texture.h * rows
	}
	setmetatable(tiler, tiler_mt)
	return tiler
end

return {
	create = create
}

