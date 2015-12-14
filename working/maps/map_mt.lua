local camera = require('util.camera')
local hud    = require('hud.hud')

local map_mt = {
}
map_mt.__index = map_mt;

function map_mt:enter()
	camera.config(self.w, self.h)
	-- Load resources?
end

function map_mt:exit()
	-- Unload resources?
end

function map_mt:update()
	local player = self.player
	player:update()
	if player.x < 0                 then player.x = 0                 end
	if player.y < 0                 then player.y = 0                 end
	if player.x > self.w - player.w then player.x = self.w - player.w end
	if player.y > self.h - player.h then player.y = self.h - player.h end
	camera.lookat(player.x, player.y)
end

function map_mt:draw()
	-- Clear output buffer.
	set_draw_color(25, 25, 25, 255)
	render_clear()

	-- Draw background.
	local t = self.bg
	local left = math.modf(camera.x / t.w) * t.w
	local top  = math.modf(camera.y / t.h) * t.h
	local x, y = camera.screen(left, top)
	t:draw(x - t.w, y - t.h)
	t:draw(x - t.w, y)
	t:draw(x - t.w, y + t.h)
	t:draw(x      , y - t.h)
	t:draw(x      , y)
	t:draw(x      , y + t.h)
	t:draw(x + t.w, y - t.h)
	t:draw(x + t.w, y)
	t:draw(x + t.w, y + t.h)

	-- Draw everything else.
	for i = 1, #self.objs do self.objs[i]:draw() end
        self.player:draw()
        hud.draw()
        render()
end

return map_mt

