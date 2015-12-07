-- The following is needed for dofile to run correctly for installed OS X apps.
local org_dofile = dofile
function dofile(file)
	if string.sub(file, 1, 1) == '/' then 
		org_dofile(file)
	else
		org_dofile(resource_dir .. file)
	end
end

--black = { r = 0, g = 0, b = 0 }

--function on_window_size_changed()
--	if on_render_targets_reset then on_render_targets_reset() end
--end

function on_render_targets_reset()
	if draw then draw() end
end

print('resource_dir = ' .. resource_dir)
print('save_dir = ' .. save_dir)
print('path_separator = ' .. path_separator)

--dofile('screens/title/main.lua')
dofile('maps/dessert/main.lua')

