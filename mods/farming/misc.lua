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
	recipe = {
		{"farming:cotton", "farming:cotton"},
		{"farming:cotton", "farming:cotton"},
	}
})

-- Straw
minetest.register_craft({
	output = "farming:straw 3",
	recipe = {
		{"farming:wheat", "farming:wheat", "farming:wheat"},
		{"farming:wheat", "farming:wheat", "farming:wheat"},
		{"farming:wheat", "farming:wheat", "farming:wheat"},
	}
})

minetest.register_craft({
	output = "farming:wheat 3",
	recipe = {
		{"farming:straw"},
	}
})

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

})
