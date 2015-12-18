local window_half_width  = window_width  / 2
local window_half_height = window_height / 2

local camera = {
	x = window_half_width,
	y = window_half_height
}

local min_x = window_half_width
local min_y = window_half_height
local max_x = window_half_width 
local max_y = window_half_height

function camera.lookat(x, y)
	x = x - window_half_width
	y = y - window_half_height
	if      x < 0      then  camera.x = 0
	elseif  x > max_x  then  camera.x = max_x
	else                     camera.x = x
	end
	if      y < 0      then  camera.y = 0
	elseif  y > max_y  then  camera.y = max_y
	else                     camera.y = y
	end
end

function camera.screen(x, y)
	return x - camera.x, camera.y + window_height - y
end

function camera.config(world_width, world_height)
	if world_height == nil then error("camera.config called without world height argument") end
	camera.world_width  = world_width
	camera.world_height = world_height
	camera.x            = window_half_width
	camera.y            = window_half_height
	max_x               = world_width  - window_width 
	max_y               = world_height - window_height
end

return camera

