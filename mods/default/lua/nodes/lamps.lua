-- mods/default/lua/items/lamps.lua
-- ================================
-- See README.txt for licensing and other information.

default.register_node("default:meselamp", {
	description = "Mese Lamp",
	drawtype = "glasslike",
	tiles = {"default_meselamp.png"},
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {cracky = 3, oddly_breakable_by_hand = 3},
	sounds = default.node_sound_glass_defaults(),
	light_source = default.LIGHT_MAX,
})


-- Crafting

core.register_craft({
	output = "default:meselamp 2",
	recipe = {
		{"", "default:mese_crystal",""},
		{"default:mese_crystal", "default:obsidian_glass", "default:mese_crystal"},
	}
})
