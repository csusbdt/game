local camera = {
	x = math.tointeger(window_width / 2),
	y = math.tointeger(window_height / 2)
}

camera.include = function(x, y)
	camera.x = x
	camera.y = y
	camera.dx = x - 512
	camera.dy = y - 388
end

camera.screen = function(x, y)
	return x - camera.dx, y - camera.dy
end

return camera

