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
	if      x < min_x  then  camera.x = min_x 
	elseif  x > max_x  then  camera.x = max_x
	else                     camera.x = x
	end
	if      y < min_y  then  camera.y = min_y
	elseif  y > max_y  then  camera.y = max_y
	else                     camera.y = y
	end
end

function camera.screen(x, y)
	return x - camera.x + window_half_width, y - camera.y + window_half_height
end

function camera.config(world_width, world_height)
	if world_height == nil then error("camera.config called without world height argument") end
	camera.x = window_half_width
	camera.y = window_half_height
	min_x    = window_half_width
	min_y    = window_half_height
	max_x    = world_width  - window_half_width 
	max_y    = world_height - window_half_height
end

return camera;

