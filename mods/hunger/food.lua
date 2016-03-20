local register_food = hunger.register_food

register_food("default:apple", 1)
register_food("default:old_apple", 1, "", 1)
register_food("default:old_bread", 4, "", 3)

if minetest.get_modpath("farming") ~= nil then
	register_food("farming:bread", 3)
	register_food("farming:potato", 2)
end

if minetest.get_modpath("creatures") ~= nil then
	register_food("creatures:meat", 5)
	register_food("creatures:flesh", 2)
	register_food("creatures:rotten_flesh", 3, "", 3)
end
