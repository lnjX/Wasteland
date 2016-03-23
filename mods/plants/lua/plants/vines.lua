default.register_node ("plants:vine", {
	description = "Vine",
	drawtype = "signlike",
	tiles = {"plants_vine.png"},
	inventory_image = "plants_vine.png",
	wield_image = "plants_vine.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	climbable = true,
	buildable_to = true,
	is_ground_content = false,
	selection_box = {
		type = "wallmounted"
	},
	groups = {snappy = 3, leafdecay = 3, flammable = 2, fuel = 1},
	legacy_wallmounted = true,
	sounds = default.node_sound_leaves_defaults(),
})
