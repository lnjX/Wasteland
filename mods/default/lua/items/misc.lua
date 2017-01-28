-- mods/default/lua/items/misc.lua
-- ===============================
-- See README.txt for licensing and other information.

default.register_craftitem("default:stick", {
	description = "Stick",
	inventory_image = "default_stick.png",
	groups = {stick = 1, fuel = 1},
})

default.register_craftitem("default:paper", {
	description = "Paper",
	inventory_image = "default_paper.png",
	groups = {fuel = 1},
})

default.register_craftitem("default:clay_lump", {
	description = "Clay Lump",
	inventory_image = "default_clay_lump.png",
})

default.register_craftitem("default:clay_brick", {
	description = "Clay Brick",
	inventory_image = "default_clay_brick.png",
})

default.register_craftitem("default:obsidian_shard", {
	description = "Obsidian Shard",
	inventory_image = "default_obsidian_shard.png",
})

default.register_craftitem("default:charcoal", {
	description = "Charcoal",
	inventory_image = "default_charcoal.png",
	groups = {coal = 1, fuel = 30},
})

default.register_craftitem("default:bone", {
	description = "Bone",
	inventory_image = "default_bone.png",
})


--
-- Crafting
--

core.register_craft({
	output = "default:stick 4",
	recipe = {
		{"group:wood"},
	}
})

core.register_craft({
	output = "default:paper",
	recipe = {
		{"default:papyrus", "default:papyrus", "default:papyrus"},
	}
})

core.register_craft({
	output = "default:clay_brick 4",
	recipe = {
		{"default:brick"},
	}
})

core.register_craft({
	type = "cooking",
	output = "default:clay_brick",
	recipe = "default:clay_lump",
})

core.register_craft({
	output = "default:obsidian_shard 9",
	recipe = {
		{"default:obsidian"}
	}
})

core.register_craft({
	type = "cooking",
	output = "default:charcoal",
	recipe = "group:tree",
})
