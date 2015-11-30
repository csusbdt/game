local camera = {
	x = math.tointeger(window_width / 2),
	y = math.tointeger(window_height / 2)
}

camera.include = function(x, y)
	camera.x = x
	camera.y = y
end

return camera

