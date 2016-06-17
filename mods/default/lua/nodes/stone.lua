default.register_node("default:stone", {
	description = "Stone",
	tiles = {"default_stone.png"},
	groups = {cracky = 3, stone = 1},
	drop = 'default:cobble',
	legacy_mineral = true,
	sounds = default.node_sound_stone_defaults(),
	register = {stair = true, slab = true, table = true, wall = true},
	table = {
		groups = {cracky = 3}
	},
})

default.register_node("default:desert_stone", {
	description = "Desert Stone",
	tiles = {"default_desert_stone.png"},
	groups = {cracky = 3, stone = 1},
	drop = 'default:desert_cobble',
	legacy_mineral = true,
	sounds = default.node_sound_stone_defaults(),
	register = {stair = true, slab = true, wall = true},
})

default.register_node("default:sandstone", {
	register = {stair = true, slab = true, wall = true},
	description = "Sandstone",
	tiles = {"default_sandstone.png"},
	groups = {crumbly = 2, cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})

default.register_node("default:obsidian", {
	register = {stair = true, slab = true, wall = true},
	description = "Obsidian",
	tiles = {"default_obsidian.png"},
	sounds = default.node_sound_stone_defaults(),
	groups = {cracky = 1, level = 2},
})
