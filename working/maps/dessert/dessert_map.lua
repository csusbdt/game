local textures  = require('res.textures')
local map_mt    = require('maps.map_mt')

-- Create player.
local player  = require('player/kurock/kurock_player')
player.x = 200
player.y = 200

-- Create map objects.
local of = require('maps.dessert.dessert_objs')
local objs = {}
objs[#objs + 1] = of.create_bolder1{x =  50, y = 200}
objs[#objs + 1] = of.create_bolder2{x = 100, y = 200}
objs[#objs + 1] = of.create_bolder3{x = 200, y = 200}
objs[#objs + 1] = of.create_bolder4{x = 300, y = 200}
objs[#objs + 1] = of.create_bolder2{x = 400, y = 200}
objs[#objs + 1] = of.create_cactus1{x =  50, y = 400}
objs[#objs + 1] = of.create_cactus2{x = 100, y = 400}
objs[#objs + 1] = of.create_shrub1{x = 200, y = 400}
objs[#objs + 1] = require('objs.dot').create{x = 300, y = 300}

-- Create map.
local map = {
	bg = textures.image('maps/dessert/dessert_sand.png'),
	w  = window_width  * 3,
	h  = window_height * 3,
	objs = objs,
	player = player
};
setmetatable(map, map_mt)

-- Create event handlers.

function on_enter_down()
end

function on_e_down()
	--if chest2:contains(player.x + 32, player.y + 32) then
	--	dofile('screens/room2.lua')
	--end
end

function on_spacebar_down()
end

function on_update()
	map:update()
	map:draw()
end

return map

