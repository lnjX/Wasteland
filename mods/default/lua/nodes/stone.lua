-- mods/default/lua/nodes/stone.lua
-- ================================
-- See README.txt for licensing and other information.

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


-- Crafting

core.register_craft({
	type = "cooking",
	output = "default:stone",
	recipe = "default:cobble",
})

core.register_craft({
	type = "cooking",
	output = "default:stone",
	recipe = "default:mossycobble",
})

core.register_craft({
	type = "cooking",
	output = "default:desert_stone",
	recipe = "default:desert_cobble",
})

core.register_craft({
	output = "default:sandstone",
	recipe = {
		{"group:sand", "group:sand"},
		{"group:sand", "group:sand"},
	}
})

core.register_craft({
	output = "default:obsidian",
	recipe = {
		{"default:obsidian_shard", "default:obsidian_shard", "default:obsidian_shard"},
		{"default:obsidian_shard", "default:obsidian_shard", "default:obsidian_shard"},
		{"default:obsidian_shard", "default:obsidian_shard", "default:obsidian_shard"},
	}
})
