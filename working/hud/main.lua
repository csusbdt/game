local textures = require('res/textures')

local t = textures.image('hud/hud.png')

local function draw()
	t:draw(0, window_height - t.h)
end

return {
	draw = draw
}

