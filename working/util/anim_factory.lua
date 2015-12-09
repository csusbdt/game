local anim_mt = {}
anim_mt.__index = anim_mt

function anim_mt:loop()
	local i = 1
	local ticks = self.frames[i].t
	return function(x, y)
		ticks = ticks - 1
		if ticks < 1 then 
			i = i + 1
			if i > #self.frames then i = 1 end
			ticks = self.frames[i].t
		end
		local frame = self.frames[i]
		frame.s:draw(frame.x, frame.y, frame.w, frame.h, x, y)	
	end
end

local function create(frames)
	local anim = {}
	anim.frames = frames
	setmetatable(anim, anim_mt)
	return anim
end

return {
	create = create
}

