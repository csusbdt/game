local camera = {
	x = window_width / 2,
	y = window_height / 2
}

camera.include = function(x0, y0)
	x = x0
	y = y0
end

return camera

