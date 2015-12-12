local textures = require('res/textures')

local t = textures.image('hud/hud.png')

local hud = {}

function hud.draw()
	t:draw(0, window_height - t.h)
end

return hud

