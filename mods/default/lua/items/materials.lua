-- mods/default/lua/items/materials.lua
-- ====================================
-- See README.txt for licensing and other information.

default.register_craftitem("default:flint", {
	description = "Flint",
	inventory_image = "default_flint.png"
})

-- Mese

default.register_craftitem("default:mese_crystal", {
	description = "Mese Crystal",
	inventory_image = "default_mese_crystal.png",
})

default.register_craftitem("default:mese_crystal_fragment", {
	description = "Mese Crystal Fragment",
	inventory_image = "default_mese_crystal_fragment.png",
})


-- Minerals

default.register_craftitem("default:coal_lump", {
	description = "Coal Lump",
	inventory_image = "default_coal_lump.png",
	groups = {coal = 1, fuel = 40}
})

default.register_craftitem("default:iron_lump", {
	description = "Iron Lump",
	inventory_image = "default_iron_lump.png",
})

default.register_craftitem("default:copper_lump", {
	description = "Copper Lump",
	inventory_image = "default_copper_lump.png",
})

default.register_craftitem("default:gold_lump", {
	description = "Gold Lump",
	inventory_image = "default_gold_lump.png",
})

default.register_craftitem("default:diamond", {
	description = "Diamond",
	inventory_image = "default_diamond.png",
})

default.register_craftitem("default:salt", {
	description = "Salt",
	inventory_image = "default_salt.png"
})


-- Ingots

default.register_craftitem("default:steel_ingot", {
	description = "Steel Ingot",
	inventory_image = "default_steel_ingot.png",
})

default.register_craftitem("default:copper_ingot", {
	description = "Copper Ingot",
	inventory_image = "default_copper_ingot.png",
})

default.register_craftitem("default:bronze_ingot", {
	description = "Bronze Ingot",
	inventory_image = "default_bronze_ingot.png",
})

default.register_craftitem("default:gold_ingot", {
	description = "Gold Ingot",
	inventory_image = "default_gold_ingot.png"
})

--
-- Crafting
--

-- Mese

core.register_craft({
	output = "default:mese_crystal 9",
	recipe = {
		{"default:mese"},
	}
})

core.register_craft({
	output = "default:mese_crystal_fragment 9",
	recipe = {
		{"default:mese_crystal"},
	}
})

-- Minerals

core.register_craft({
	output = "default:coal_lump 9",
	recipe = {
		{"default:coalblock"},
	}
})

core.register_craft({
	output = "default:steel_ingot 9",
	recipe = {
		{"default:steelblock"},
	}
})

core.register_craft({
	output = "default:copper_ingot 9",
	recipe = {
		{"default:copperblock"},
	}
})

core.register_craft({
	output = "default:bronze_ingot 9",
	recipe = {
		{"default:bronzeblock"},
	}
})

core.register_craft({
	output = "default:gold_ingot 9",
	recipe = {
		{"default:goldblock"},
	}
})

core.register_craft({
	output = "default:diamond 9",
	recipe = {
		{"default:diamondblock"},
	}
})


-- Ingots

core.register_craft({
	type = "cooking",
	output = "default:steel_ingot",
	recipe = "default:iron_lump",
})

core.register_craft({
	type = "cooking",
	output = "default:copper_ingot",
	recipe = "default:copper_lump",
})

core.register_craft({
	type = "shapeless",
	output = "default:bronze_ingot",
	recipe = {"default:steel_ingot", "default:copper_ingot"},
})

core.register_craft({
	type = "cooking",
	output = "default:gold_ingot",
	recipe = "default:gold_lump",
})
