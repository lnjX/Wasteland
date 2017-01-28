-- mods/default/lua/nodes/signs.lua
-- ================================
-- See README.txt for licensing and other information.

default.register_sign("default:sign_wall_wood", {
	description = "Wooden Sign",
	texture_wall = "default_sign_wall_wood.png",
	texture = "default_sign_wood.png",
	sounds = default.node_sound_wood_defaults(),
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, fences_connect = 1}
})

default.register_sign("default:sign_wall_steel", {
	description = "Steel Sign",
	texture_wall = "default_sign_wall_steel.png",
	texture = "default_sign_steel.png",
	sounds = default.node_sound_defaults(),
	groups = {cracky = 2, fences_connect = 1}
})

-- Crafting

core.register_craft({
	output = "default:sign_wall_wood",
	recipe = {
		{"group:wood", "group:wood", "group:wood"},
		{"group:wood", "group:wood", "group:wood"},
		{"", "group:stick", ""},
	}
})

core.register_craft({
	output = "default:sign_wall_steel",
	recipe = {
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
		{"", "group:stick", ""},
	}
})
