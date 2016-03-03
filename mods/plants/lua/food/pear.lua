minetest.register_node("plants:pear", {
	description = "Pear",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"plants_pear.png"},
	inventory_image = "plants_pear.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.2, -0.5, -0.2, 0.2, 0, 0.2}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(1),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "plants:pear", param2 = 1})
		end
	end,
})

--[[
minetest.register_alias("plants:pear_3", "plants:pear")
3
minetest.register_node("plants:pear_1", {
	drawtype = "plantlike",
	drop = "",
	visual_scale = 1.0,
	tiles = {"plants_pear_1.png"},
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.2, -0.5, -0.2, 0.2, 0, 0.2}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2, not_in_creative_inventory = 1,
		leafdecay = 3, leafdecay_drop = 1},
	sounds = default.node_sound_leaves_defaults(),
--[[
	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "default:apple", param2 = 1})
		end
	end,
--]
})

minetest.register_node("plants:pear_2", {
	drawtype = "plantlike",
	drop = "",
	visual_scale = 1.0,
	tiles = {"plants_pear_2.png"},
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.2, -0.5, -0.2, 0.2, 0, 0.2}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2, not_in_creative_inventory = 1,
		leafdecay = 3, leafdecay_drop = 1},
	sounds = default.node_sound_leaves_defaults(),
--[[
	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "default:apple", param2 = 1})
		end
	end,
--]
})


minetest.register_abm({
	nodenames = {"group:growing_fruit"},
	interval = 30,
	chance = 30,
	action = function (pos, node)
		
	end
})

--]]