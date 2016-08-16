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
	step_after_harvest = 4,
	-- after the plant has been harvested,
	-- it only needs ~380 s to get mature again
	growtime = 900,
	has_seed = false,
	cond = {
		fertility = {"grassland"},
		light = {min = 13, max = default.LIGHT_MAX},
	},
	harvest = {
		on_use = core.item_eat(1),
	},
})

farming.register_crop("lettuce", {
	description = "Lettuce",
	steps = 7,
	growtime = 380,
	has_seed = false,
	cond = {
		fertility = {"grassland"},
		light = {min = 13, max = default.LIGHT_MAX},
	},
	harvest = {
		on_use = core.item_eat(0.7)
	}
})
