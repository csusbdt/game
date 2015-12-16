--
-- This will replace anim factory!!!!!  OR obj_mt?
--

--[[
Animation variables:
	anim                 -- string name of the animation, such as 'idleup', 'idledown', etc.
	anim_ticks_remaining -- the number of calls to draw before the end of the frame
	anim_frame_index     -- the frame index for the given animation

Animation names: idleup, idledown, idleleft, idleright, up, down, left, right
--]]

local camera = require('util.camera')

local anim_mt = {}
anim_mt.__index = anim_mt

function anim_mt:draw() 
	local x, y = camera.screen(self.x, self.y)
	local frames = self.anims[self.anim]
	if self.anim_ticks_remaining < 1 then
		self.anim_frame_index = self.anim_frame_index + 1
		if self.anim_frame_index > #frames then self.anim_frame_index = 1 end
		self.anim_ticks_remaining = frames[self.anim_frame_index].t
	end
	local frame = frames[self.anim_frame_index]
	frame.s:draw(frame.x, frame.y, frame.w, frame.h, x, y)
end

function anim_mt:loop(anim) 
	self.anim = anim
	local frames = self.anims[anim]
	self.anim_frame_index     = 1
	self.anim_ticks_remaining = frames[self.anim_frame_index].t
end

return anim_mt

