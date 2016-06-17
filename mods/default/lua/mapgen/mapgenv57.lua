-- mods/default/lua/mapgenv57.lua

--
-- Register biomes
--

core.clear_registered_biomes()

core.register_biome({
	name = "wasteland",
-- 	node_dust = "",
	node_top = "default:dry_dirt",
	depth_top = 5,
	node_filler = "default:dry_dirt",
	depth_filler = 0,
-- 	node_stone = "",
	node_water_top = "air",
	depth_water_top = 0,
	node_water = "air",
	node_river_water = "air",
	y_min = 2,
	y_max = 55,
	heat_point = 70,
	humidity_point = 20,
})

core.register_biome({
	name = "wasteland_ocean",
-- 	node_dust = "",
	node_top = "default:sand",
	depth_top = 5,
	node_filler = "default:sandstone",
	depth_filler = 0,
-- 	node_stone = "",
	node_water_top = "air",
	depth_water_top = 0,
	node_water = "air",
	node_river_water = "air",
	y_min = -112,
	y_max = 1,
	heat_point = 70,
	humidity_point = 20,
})

core.register_biome({
	name = "snow_cap",
	node_dust = "default:snow",
	node_top = "default:dry_dirt_with_snow",
	depth_top = 1,
	node_filler = "default:dry_dirt",
	depth_filler = 2,
-- 	node_stone = "",
	node_water_top = "air",
	depth_water_top = 0,
	node_water = "air",
	node_river_water = "air",
	y_min = 56,
	y_max = 31000,
	heat_point = 70,
	humidity_point = 20,
})

-- Underground
core.register_biome({
	name = "underground",
	--node_dust = "",
	--node_top = "",
	--depth_top = ,
	--node_filler = "",
	--depth_filler = ,
	--node_stone = "",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
	--node_river_water = "",
	y_min = -31000,
	y_max = -113,
	heat_point = 50,
	humidity_point = 30,
})


--
-- Register decorations
--

core.clear_registered_decorations()

-- Dry shrub
core.register_decoration({
	deco_type = "simple",
	place_on = {"default:dry_dirt", "default:dirt_with_snow"},
	sidelen = 16,
	noise_params = {
		offset = 0,
		scale = 0.02,
		spread = {x = 200, y = 200, z = 200},
		seed = 329,
		octaves = 3,
		persist = 0.6
	},
	biomes = {"wasteland", "snow_cap"},
	y_min = 2,
	y_max = 31000,
	decoration = "default:dry_shrub",
})


core.register_on_generated(default.generate_nyancats)
core.register_on_generated(default.generate_ruins)
