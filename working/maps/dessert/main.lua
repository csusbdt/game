local textures = require('res.textures')
local buttons  = require('eng.buttons')
local camera   = require('eng.camera')

local sand   = textures.image('maps/dessert/sand.png')
local width  = 1024 * 3
local height =  576 * 3

local tiler_mt = {}
tiler_mt.__index = tiler_mt;

function tiler_mt.draw()
	-- Compute coordinates of upper left corners of 
	-- the tile containing the camera and its 8 neighbors.
	local x2 = math.modf(camera.x / 1024) * 1024
	local x1 = x2 - 1024
	local x3 = x2 + 1024
	local y2 = math.modf(camera.y / 576) * 576
	local y1 = y2 - 576
	local y3 = y2 + 576

	local dx = 512 - (camera.x % 1024)
	local dy = 288 - (camera.y % 576)


	-- row 1
	if x1 > -1024 and y1 > -576 then sand:draw(dx - 1024, dy - 576) end
	if                y1 > -576 then sand:draw(dx       , dy - 576) end
	if x3 < width and y1 > -576 then sand:draw(dx + 1024, dy - 576) end

	-- row 2
	if x1 > -1024               then sand:draw(dx - 1024, dy) end
	                                 sand:draw(dx       , dy)
	if x3 < width               then sand:draw(dx + 1024, dy) end

	-- row 3
	if x1 > -1024 and y3 < height then sand:draw(dx - 1024, dy + 576) end
	if                y3 < height then sand:draw(dx       , dy + 576) end
	if x3 < width and y3 < height then sand:draw(dx + 1024, dy + 576) end
end

local tiler = {}
setmetatable(tiler, tiler_mt)

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
	if player.x < player.w / 2 then player.x = player.w / 2 end
	if player.x + player.w / 2 > width then player.x = width - player.w / 2 end
	if player.y < player.h / 2 then player.y = player.h / 2 end
	if player.y + player.h / 2 > height then player.y = height - player.h / 2 end
	camera.include(player.x, player.y)
	draw()
end

collectgarbage()

