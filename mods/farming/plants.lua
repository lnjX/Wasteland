-- Wheat
farming.register_plant({
	plantname = "wheat",
	seed = {
		description = "Wheat Seed",
		inventory_image = "farming_wheat_seed.png",
	},
	harvest = {
		description = "Wheat",
		inventory_image = "farming_wheat.png",
	},
	steps = 8,
	minlight = 13,
	maxlight = default.LIGHT_MAX,
	fertility = {"grassland"}
})

-- Cotton
farming.register_plant({
	plantname = "cotton",
	seed = {
		description = "Cotton Seeds",
		inventory_image = "farming_cotton_seed.png",
	},
	harvest = {
		description = "Cotton",
		inventory_image = "farming_cotton.png",
	},
	steps = 8,
	minlight = 13,
	maxlight = default.LIGHT_MAX,
	fertility = {"grassland", "desert"}
})

-- Potato
farming.register_plant({
	plantname = "potato",
	description = "Potato",
	inventory_image = "farming_potato.png",
	steps = 3,
	has_seed = false,
	minlight = 13,
	maxlight = default.LIGHT_MAX,
	fertility = {"grassland"},
	on_use = minetest.item_eat(1)
})
