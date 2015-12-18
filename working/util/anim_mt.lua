--[[
Animation variables:
	anim                 -- string name of the animation, such as 'idleup', 'idledown', etc.
	anims                -- table of animations, where each animation is a sequence of frames.
	anim_ticks_remaining -- the number of calls to draw before the end of the frame.
	anim_frame_index     -- the frame index for the given animation.
--]]

local camera = require('util.camera')
local obj_mt = require('util.obj_mt')

local anim_mt = {}
anim_mt.__index = anim_mt

setmetatable(anim_mt, obj_mt)

function anim_mt:draw() 
	local x, y = camera.screen(self.x, self.y)
	local frames = self.anims[self.anim]
	self.anim_ticks_remaining = self.anim_ticks_remaining - 1
	if self.anim_ticks_remaining < 1 then
		self.anim_frame_index = self.anim_frame_index + 1
		if self.anim_frame_index > #frames then self.anim_frame_index = 1 end
		self.anim_ticks_remaining = frames[self.anim_frame_index].t
	end
	local frame = frames[self.anim_frame_index]
	frame.s:draw(frame.x, frame.y, frame.w, frame.h, x, y - frame.h)
end

function anim_mt:loop(anim) 
	if self.anim == anim then return end
	self.anim = anim
	local frames = self.anims[anim]
	self.anim_frame_index     = 1
	self.anim_ticks_remaining = frames[self.anim_frame_index].t
end

return anim_mt

