-- Global Vars.
food = {}
food.STACK_MAX = 48

-- 
-- Food
--
default.register_craftitem("food:flour", {
	description = "Flour",
	inventory_image = "food_flour.png",
	stack_max = food.STACK_MAX
})


default.register_craftitem("food:fried_egg", {
	description = "Fried Egg",
	inventory_image = "food_fried_egg.png",
	on_use = core.item_eat(2),
	stack_max = food.STACK_MAX
})


--
-- Rolls
--
default.register_craftitem("food:roll", {
	description = "Roll",
	inventory_image = "food_roll.png",
	groups = {roll = 1, food = 1},
	on_use = core.item_eat(3),
	stack_max = food.STACK_MAX
})

default.register_craftitem("food:roll_with_fried_egg", {
	description = "Roll with Fried Egg",
	inventory_image = "food_roll_with_fried_egg.png",
	groups = {roll = 2, food = 1},
	on_use = core.item_eat(5),
	stack_max = food.STACK_MAX
})

-- Recipes
core.register_craft({
	type = "shapeless",
	output = "food:flour",
	recipe = {"farming:wheat", "farming:wheat", "farming:wheat"}
})

core.register_craft({
	type = "shapeless",
	output = "food:roll_with_fried_egg",
	recipe = {"food:roll", "food:fried_egg"}
})

core.register_craft({
	type = "cooking",
	cooktime = 15,
	output = "food:roll",
	recipe = "food:flour"
})

core.register_craft({
	type = "cooking",
	output = "food:fried_egg",
	recipe = "creatures:egg",
})

-- Aliases for backwards-compatibility
core.register_alias("creatures:fried_egg", "food:fried_egg")
core.register_alias("farming:bread", "food:roll")
core.register_alias("farming:flour", "food:flour")
