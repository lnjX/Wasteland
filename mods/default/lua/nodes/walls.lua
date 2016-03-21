function default.register_wall(itemstring, def)
	if not def.groups then
		def.groups = {cracky = 3, wall = 1}
	end
	if not def.sounds then
		def.sounds = default.node_sound_stone_defaults()
	end
	
	core.register_node(itemstring, {
		description = def.description,
		tiles = def.tiles,
		drawtype = "nodebox",
		node_box = {
			type = "connected",
			fixed = {{-1/4, -1/2, -1/4, 1/4, 1/2, 1/4}},
			connect_front = {{-3/16, -1/2, -1/2,  3/16, 3/8, -1/4}},
			connect_left = {{-1/2, -1/2, -3/16, -1/4, 3/8,  3/16}},
			connect_back = {{-3/16, -1/2,  1/4,  3/16, 3/8,  1/2}},
			connect_right = {{ 1/4, -1/2, -3/16,  1/2, 3/8,  3/16}},
		},
		connects_to = {"group:cracky", "group:wall", "group:stone"},
		paramtype = "light",
		is_ground_content = false,
		groups = def.groups,
		sounds = def.sounds,
	})
	
	if not def.no_craft then
		core.register_craft({
			output = itemstring .. " 4",
			recipe = {
				{def.material, def.material, def.material},
				{def.material, def.material, def.material},
			}
		})
	end
end

default.register_wall("default:wall_cobble", {
	description = "Cobblestone Wall",
	tiles = {"default_cobble.png"},
	material = "default:cobble"
})

default.register_wall("default:wall_stone", {
	description = "Stone Wall",
	tiles = {"default_stone.png"},
	material = "default:stone"
})

default.register_wall("default:wall_desert_stone", {
	description = "Desert Stone Wall",
	tiles = {"default_desert_stone.png"},
	material = "default:desert_stone"
})

default.register_wall("default:wall_sandstone", {
	description = "Sandstone Wall",
	tiles = {"default_sandstone.png"},
	material = "default:sandstone"
})

default.register_wall("default:wall_obsidian", {
	description = "Obsidian Wall",
	tiles = {"default_obsidian.png"},
	material = "default:obsidian"
})
