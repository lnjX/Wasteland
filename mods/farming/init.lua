<<<<<<< HEAD
farming = {}
farming.path = minetest.get_modpath("farming")

-- Load files
dofile(farming.path .. "/api.lua")
dofile(farming.path .. "/nodes.lua")
dofile(farming.path .. "/hoes.lua")
dofile(farming.path .. "/plants.lua")
dofile(farming.path .. "/misc.lua")
=======
-- This file is part of Minetest TNG
-- =================================
-- mods/farming/init.lua
-- 
-- See README.txt for licensing and other information.
-- 

farming = {}

local modpath = core.get_modpath("farming")

dofile(modpath .. "/api.lua")
dofile(modpath .. "/api_hoes.lua")
dofile(modpath .. "/plants.lua")
dofile(modpath .. "/soil.lua")
dofile(modpath .. "/hoes.lua")
dofile(modpath .. "/misc.lua")
dofile(modpath .. "/aliases.lua")
>>>>>>> e27abaef044c593f710cc8520ba9fd8f0c6b3379
