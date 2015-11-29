local textures = require('res.textures')
local buttons  = require('eng.buttons')

local player = require('player/main').create{x = 200, y = 200}

local sand   = textures.image('maps/dessert/sand.png')

local objs = {}

local function add_obj(o)
	objs[#objs + 1] = o
end

local function draw_objs()
	for i = 1, #objs do objs[i]:draw() end
end


function on_enter_down()
end

function on_e_down()
	--if chest2:contains(player.x + 32, player.y + 32) then
	--	dofile('screens/room2.lua')
	--end
end

function on_spacebar_down()
end

function draw()
	set_draw_color(25, 25, 25, 255)
	render_clear()
	sand:draw(0, 0)
	sand:drawh(sand.w, 0)
	sand:drawv(0, sand.h)
	sand:drawd(sand.w, sand.h)
--[[
	for i = 0, 1024, 640 do
		for j = 0, 800, 240 do
			bricks:draw(0 + i, j, 320, 240)
			bricks:draw(0, 0, 640, 480, 320 + i, j, 320, 240)
		end
	end
--]]
	draw_objs()
	player:draw()
	render()
end

function on_update()
	player:update()
	draw()
end

collectgarbage()

