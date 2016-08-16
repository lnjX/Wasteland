-- mods/food/init.lua
-- ==================
-- See README.txt for licensing and other information.

-- Global Vars.
food = {}
food.STACK_MAX = 24


default.register_craftitem("food:flour", {
	description = "Flour",
	inventory_image = "food_flour.png",
	groups = {food = 2}
})


default.register_craftitem("food:fried_egg", {
	description = "Fried Egg",
	inventory_image = "food_fried_egg.png",
	on_use = core.item_eat(2),
	stack_max = food.STACK_MAX,
	groups = {food = 4}
})


--
-- Rolls
--
default.register_craftitem("food:roll", {
	description = "Roll",
	inventory_image = "food_roll.png",
	groups = {roll = 1, food = 4},
	on_use = core.item_eat(3),
	stack_max = food.STACK_MAX
})

default.register_craftitem("food:roll_with_fried_egg", {
	description = "Roll with Fried Egg",
	inventory_image = "food_roll_with_fried_egg.png",
	groups = {roll = 2, food = 5, on_eat_heal = 1},
	on_use = core.item_eat(6),
	stack_max = food.STACK_MAX / 2
})

default.register_craftitem("food:hamburger", {
	description = "Hamburger",
	inventory_image = "food_hamburger.png",
	groups = {roll = 2, food = 5, on_eat_heal = 1},
	on_use = core.item_eat(8),
	stack_max = food.STACK_MAX / 2
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
	type = "shapeless",
	output = "food:hamburger",
	recipe = {"food:roll", "group:meat"}
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
