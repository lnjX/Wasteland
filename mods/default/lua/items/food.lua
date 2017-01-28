default.register_craftitem("default:pear", {
	description = "Pear",
	inventory_image = "default_pear.png",
	groups = {fruit = 1, food = 3},
	on_use = core.item_eat(1),
})

core.register_craftitem("default:old_apple", {
	description = "Old Apple",
	inventory_image = "default_old_apple.png",
	on_use = minetest.item_eat(1),
	stack_max = 60,
})

core.register_craftitem("default:old_bread", {
	description = "Old Bread",
	inventory_image = "default_old_bread.png",
	on_use = minetest.item_eat(2),
	stack_max = 60,
})
