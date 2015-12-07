local textures       = require('res.textures')
local buttons        = require('eng.buttons')
local hud            = require('hud.main')
local object_factory = require('maps.dessert.objs')

local sand    = textures.image('maps/dessert/sand.png')
local tiler   = require('maps.tiler').create(sand)
local player  = require('player/main').create{x = 200, y = 200}

local world_width  = window_width  * 2
local world_height = window_height * 2
local camera = require('eng.camera').create(world_width, world_height)

local objs = {}

local function add_obj(o)
	objs[#objs + 1] = o
end

local function draw_objs()
	for i = 1, #objs do objs[i]:draw(camera) end
end

local b1  = object_factory.create_bolder1{x =  50, y = 200}
local b2  = object_factory.create_bolder2{x = 100, y = 200}
local b3  = object_factory.create_bolder3{x = 200, y = 200}
local b4  = object_factory.create_bolder4{x = 300, y = 200}
local b5  = object_factory.create_bolder2{x = 400, y = 200}
local c1  = object_factory.create_cactus1{x =  50, y = 400}
local c2  = object_factory.create_cactus2{x = 100, y = 400}
local s1  = object_factory.create_shrub1{x = 200, y = 400}
local dot = require('objs.dot').create{x = 300, y = 300}
add_obj(b1);
add_obj(b2);
add_obj(b3);
add_obj(b4);
add_obj(b5);
add_obj(c1);
add_obj(c2);
add_obj(s1);
add_obj(dot);

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
	tiler:draw(camera)
	draw_objs()
	player:draw(camera)
	hud.draw()
	render()
end

function on_update()
	player:update()
	if player.x < 0            then player.x = 0            end
	if player.y < 0            then player.y = 0            end
	if player.x > world_width  - player.w then player.x = world_width  - player.w end
	if player.y > world_height - player.h then player.y = world_height - player.h end
	camera:lookat(player.x, player.y)
	draw()
end

collectgarbage()

