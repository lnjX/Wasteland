<<<<<<< HEAD
-- Wheat
farming.register_plant("farming:wheat", {
	description = "Wheat seed",
	inventory_image = "farming_wheat_seed.png",
	steps = 8,
	minlight = 13,
	maxlight = default.LIGHT_MAX,
	fertility = {"grassland"}
})

-- Cotton
farming.register_plant("farming:cotton", {
	description = "Cotton seed",
	inventory_image = "farming_cotton_seed.png",
	steps = 8,
	minlight = 13,
	maxlight = default.LIGHT_MAX,
	fertility = {"grassland", "desert"}
})

-- Potato
farming.register_plant("farming:potato", {
	description = "Potato",
	inventory_image = "farming_potato.png",
	steps = 3,
	has_seed = false,
	minlight = 13,
	maxlight = default.LIGHT_MAX,
	fertility = {"grassland"},
  on_use = minetest.item_eat(1)
=======
farming.register_crop("wheat", {
	description = "Wheat",
	steps = 8,
	growtime = 500,
	has_seed = true,
	craft_seed_by_harvest = true,
	cond = {
		fertility = {"grassland"},
		light = {min = 13, max = default.LIGHT_MAX},
	},
})

farming.register_crop("cotton", {
	description = "Cotton",
	steps = 8,
	growtime = 520,
	has_seed = true,
	cond = {
		fertility = {"grassland", "desert"},
		light = {min = 13, max = default.LIGHT_MAX},
	},
})

farming.register_crop("potato", {
	description = "Potato",
	steps = 3,
	growtime = 450,
	has_seed = false,
	cond = {
		fertility = {"grassland"},
		light = {min = 13, max = default.LIGHT_MAX},
	},
	harvest = {
		on_use = core.item_eat(1),
	},
})

farming.register_crop("strawberry", {
	description = "Strawberries",
	steps = 7,
	growtime = 480,
	has_seed = false,
	cond = {
		fertility = {"grassland"},
		light = {min = 13, max = default.LIGHT_MAX},
	},
	harvest = {
		on_use = core.item_eat(1),
	},
>>>>>>> e27abaef044c593f710cc8520ba9fd8f0c6b3379
})
