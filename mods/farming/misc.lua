core.register_alias("farming:string", "farming:cotton")

-- Wool
core.register_craft({
	output = "default:wool_white",
	recipe = {
		{"farming:cotton", "farming:cotton"},
		{"farming:cotton", "farming:cotton"},
	}
})

-- Straw
core.register_craft({
	output = "farming:straw 3",
	recipe = {
		{"farming:wheat", "farming:wheat", "farming:wheat"},
		{"farming:wheat", "farming:wheat", "farming:wheat"},
		{"farming:wheat", "farming:wheat", "farming:wheat"},
	}
})

core.register_craft({
	output = "farming:wheat 3",
	recipe = {
		{"farming:straw"},
	}
})
