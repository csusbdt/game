local textures = require('res.textures')
local buttons  = require('eng.buttons')
local camera   = require('eng.camera')

local sand  = textures.image('maps/dessert/sand.png')
local tiler = require('maps.tiler').create(sand, 3, 3)

local player = require('player/main').create{x = 200, y = 200}

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
	tiler:draw()
	draw_objs()
	player:draw()
	render()
end

function on_update()
	player:update()
	if player.x < player.w / 2                then player.x = player.w / 2                end
	if player.x + player.w / 2 > tiler.map_w  then player.x = tiler.map_w - player.w / 2  end
	if player.y < player.h / 2                then player.y = player.h / 2                end
	if player.y + player.h / 2 > tiler.map_h  then player.y = tiler.map_h - player.h / 2  end
	camera.include(player.x, player.y)
	draw()
end

collectgarbage()

