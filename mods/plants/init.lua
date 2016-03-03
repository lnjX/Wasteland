plants = {}

-- the growing time factor decides how long every plant needs to grow 1.0 (normal), 0.75 (fast), 1.25 (slow)
-- not used at the moment
if not minetest.setting_get ("plants_growtime_factor") then
	plants.growtime_factor = 1.0
else
	plants.growtime_factor = minetest.setting_get ("plants_growtime_factor")
end

-- execute all files
plants.path = minetest.get_modpath("plants")

-- Food
dofile (plants.path .. "/lua/food/pear.lua")

-- Plants
dofile (plants.path .. "/lua/plants/vines.lua")
