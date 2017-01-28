-- mods/default/lua/nodes/bricks.lua
-- =================================
-- See README.txt for licensing and other information.

default.register_node("default:brick", {
	description = "Brick Block",
	tiles = {"default_brick.png"},
	is_ground_content = false,
	groups = {cracky = 3},
	sounds = default.node_sound_stone_defaults(),
	register = {stair = true, slab = true, wall = true},
	stair = {
		description = "Brick Stair",
	},
	slab = {
		description = "Brick Slab",
	},
	wall = {
		description = "Brick Wall"
	}
})


-- Stonebricks

default.register_node("default:stonebrick", {
	register = {stair = true, slab = true, wall = true},
	description = "Stone Brick",
	tiles = {"default_stone_brick.png"},
	is_ground_content = false,
	groups = {cracky = 2, stone = 1},
	sounds = default.node_sound_stone_defaults()
})

default.register_node("default:desert_stonebrick", {
	register = {stair = true, slab = true, wall = true},
	description = "Desert Stone Brick",
	tiles = {"default_desert_stone_brick.png"},
	is_ground_content = false,
	groups = {cracky = 2, stone = 1},
	sounds = default.node_sound_stone_defaults()
})

default.register_node("default:sandstonebrick", {
	register = {stair = true, slab = true, wall = true},
	description = "Sandstone Brick",
	tiles = {"default_sandstone_brick.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults()
})

default.register_node("default:obsidianbrick", {
	register = {stair = true, slab = true, wall = true},
	description = "Obsidian Brick",
	tiles = {"default_obsidian_brick.png"},
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),
	groups = {cracky = 1, level = 2}
})


-- Crafting

core.register_craft({
	output = "default:brick",
	recipe = {
		{"default:clay_brick", "default:clay_brick"},
		{"default:clay_brick", "default:clay_brick"},
	}
})

core.register_craft({
	output = "default:stonebrick 4",
	recipe = {
		{"default:stone", "default:stone"},
		{"default:stone", "default:stone"},
	}
})

core.register_craft({
	output = "default:sandstonebrick 4",
	recipe = {
		{"default:sandstone", "default:sandstone"},
		{"default:sandstone", "default:sandstone"},
	}
})

core.register_craft({
	output = "default:obsidianbrick 4",
	recipe = {
		{"default:obsidian", "default:obsidian"},
		{"default:obsidian", "default:obsidian"}
	}
})

core.register_craft({
	output = "default:desert_stonebrick 4",
	recipe = {
		{"default:desert_stone", "default:desert_stone"},
		{"default:desert_stone", "default:desert_stone"},
	}
})
