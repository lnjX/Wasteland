-- This file is part of Minetest TNG
-- =================================
-- mods/default/lua/init.lua
-- 
-- See README.txt for licensing and other information.


-- Global variables
default = {}
default.LIGHT_MAX = 14

-- The hand
core.register_item(":", {
	type = "none",
	wield_image = "wieldhand.png",
	wield_scale = {x = 1, y = 1, z = 2.5},
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level = 0,
		groupcaps = {
			crumbly = {times = {[2] = 3.00, [3] = 0.70}, uses = 0, maxlevel = 1},
			snappy = {times = {[3] = 0.40}, uses = 0, maxlevel = 1},
			oddly_breakable_by_hand = {times = {[1] = 3.50, [2] = 2.00, [3] = 0.70}, uses = 0}
		},
		damage_groups = {fleshy = 1}
	}
})


-- Load files
local modpath = core.get_modpath("default")
local luapath = modpath .. "/lua/"
local mg_name = core.get_mapgen_params().mgname or ""


dofile(luapath .. "gui.lua")
dofile(luapath .. "functions.lua")
dofile(luapath .. "environment.lua")
dofile(luapath .. "sounds.lua")
-- APIs
dofile(luapath .. "apis/fences.lua")
dofile(luapath .. "apis/fencegates.lua")
dofile(luapath .. "apis/tables.lua")

dofile(luapath .. "nodes.lua") -- loads files in ./nodes/
dofile(luapath .. "items.lua") -- loads files in ./items/
dofile(luapath .. "crafting.lua")
dofile(luapath .. "mapgen.lua")

if mg_name == "v6" then
	dofile(luapath .. "mapgenv6.lua")
elseif mg_name == "v5" or mg_name == "v7" then
	dofile(luapath .. "mapgenv57.lua")
end

dofile(luapath .. "trees.lua")
dofile(luapath .. "player.lua")
dofile(luapath .. "aliases.lua")
dofile(luapath .. "legacy.lua")
dofile(luapath .. "chat_cmds.lua")
dofile(luapath .. "item_pickup.lua")
dofile(luapath .. "item_physics.lua")
