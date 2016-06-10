-- mods/default/lua/mapgenv6.lua

--
-- Register decorations
--

-- y?
core.clear_registered_decorations()

-- Dry shrubs
core.register_decoration({
	deco_type = "simple",
	place_on = {"default:desert_sand", "default:dirt_with_snow"},
	sidelen = 16,
	noise_params = {
		offset = 0,
		scale = 0.035,
		spread = {x = 100, y = 100, z = 100},
		seed = 329,
		octaves = 3,
		persist = 0.6
	},
	y_min = 1,
	y_max = 30,
	decoration = "default:dry_shrub",
})

core.register_on_generated(default.generate_nyancats)
core.register_on_generated(default.generate_ruins)
