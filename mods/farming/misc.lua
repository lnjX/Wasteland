<<<<<<< HEAD
minetest.register_craftitem("farming:flour", {
	description = "Flour",
	inventory_image = "farming_flour.png",
})

minetest.register_craftitem("farming:bread", {
	description = "Bread",
	inventory_image = "farming_bread.png",
	on_use = minetest.item_eat(5),
})

minetest.register_alias("farming:string", "farming:cotton")


-- Crafting recipes

-- Bread
minetest.register_craft({
	type = "shapeless",
	output = "farming:flour",
	recipe = {"farming:wheat", "farming:wheat", "farming:wheat", "farming:wheat"}
})

minetest.register_craft({
	type = "cooking",
	cooktime = 15,
	output = "farming:bread",
	recipe = "farming:flour"
})

-- Wool
minetest.register_craft({
	output = "wool:white",
=======
default.register_node("farming:straw", {
	register = {stair = true, slab = true},
	description = "Straw",
	tiles = {"farming_straw.png"},
	is_ground_content = false,
	groups = {snappy = 3, flammable = 4, fuel = 10},
	sounds = default.node_sound_leaves_defaults(),
	stair = {legacy_alias = "stairs:stair_straw"},
	slab = {legacy_alias = "stairs:slab_straw"},
})


for i = 1, 5 do		
	core.override_item("default:grass_"..i, {drop = {
		max_items = 1,
		items = {
			{items = {'farming:seed_wheat'}, rarity = 5},
			{items = {'default:grass_1'}},
		}
	}})
end

core.override_item("default:junglegrass", {
	drop = {
		max_items = 1,
		items = {
			{items = {'farming:seed_cotton'}, rarity = 8},
			{items = {'default:junglegrass'}},
		}
	}
})

-- Wool
core.register_craft({
	output = "default:wool_white",
>>>>>>> e27abaef044c593f710cc8520ba9fd8f0c6b3379
	recipe = {
		{"farming:cotton", "farming:cotton"},
		{"farming:cotton", "farming:cotton"},
	}
})

-- Straw
<<<<<<< HEAD
minetest.register_craft({
=======
core.register_craft({
>>>>>>> e27abaef044c593f710cc8520ba9fd8f0c6b3379
	output = "farming:straw 3",
	recipe = {
		{"farming:wheat", "farming:wheat", "farming:wheat"},
		{"farming:wheat", "farming:wheat", "farming:wheat"},
		{"farming:wheat", "farming:wheat", "farming:wheat"},
	}
})

<<<<<<< HEAD
minetest.register_craft({
=======
core.register_craft({
>>>>>>> e27abaef044c593f710cc8520ba9fd8f0c6b3379
	output = "farming:wheat 3",
	recipe = {
		{"farming:straw"},
	}
})

<<<<<<< HEAD
-- Grass ABMs
minetest.register_abm({
	nodenames = {"default:dry_dirt"},
	interval = 2,
	chance = 200,
	action = function(pos, node)
		if (minetest.find_node_near(pos, 6, {"group:water"}) and minetest.find_node_near(pos, 1, {"default:grass"})) or minetest.find_node_near(pos, 1, {"group:water"}) then
			pos.y = pos.y+1
			local nn = minetest.get_node(pos).name
			local ll = 0
			ll=minetest.get_node_light(pos)
			pos.y = pos.y-1
			if ll and ll>8 and minetest.registered_nodes[nn] and minetest.get_item_group(nn, "water") ~= 3 then
				minetest.set_node(pos, {name="default:grass"})
			end
		end
	end

})

minetest.register_abm({
	nodenames = {"default:grass"},
	interval = 2,
	chance = 20,
	action = function(pos, node)
		if not minetest.find_node_near(pos, 6, {"group:water"}) then
			minetest.set_node(pos, {name="default:dry_dirt"})
		else
			pos.y = pos.y+1
			local nn = minetest.get_node(pos).name
			pos.y = pos.y-1
			if minetest.registered_nodes[nn] and minetest.registered_nodes[nn].walkable then
				minetest.set_node(pos, {name="default:dry_dirt"})
			end
		end
	end

=======
-- Garden Soil
core.register_craft({
	type = "shapeless",
	output = "farming:garden_soil",
	recipe = {"group:dirt", "bucket:bucket_water"},
	replacements = {
		{"bucket:bucket_water", "bucket:bucket_empty"}
	},
>>>>>>> e27abaef044c593f710cc8520ba9fd8f0c6b3379
})
