-- The hand
if not core.setting_getbool("creative_mode") then
	core.register_item(":", {
		type = "none",
		wield_image = "16x_blank.png^[combine:16x16:2,2=16x_blank.png:-52,-23=character.png^[transformfy",
		wield_scale = {x = 1, y = 1, z = 2.5},
		tool_capabilities = {
			full_punch_interval = 0.9,
			max_drop_level = 0,
			groupcaps = {
				crumbly = {times = {[2] = 3.00, [3] = 0.70}, uses = 0, maxlevel = 1},
				snappy = {times = {[3] = 0.40}, uses = 0, maxlevel = 1},
				oddly_breakable_by_hand = {times = {[1] = 3.50, [2] = 2.00, [3] = 0.70}, uses = 0}
			},
			damage_groups = {fleshy = 1}
		}
	})
else
	local digtime = 0.5
	core.register_item(":", {
		type = "none",
		wield_image = "16x_blank.png^[combine:16x16:2,2=16x_blank.png:-52,-23=character.png^[transformfy",
		wield_scale = {x = 1, y = 1, z = 2.5},
		range = 10,
		tool_capabilities = {
			full_punch_interval = 0.5,
			max_drop_level = 3,
			groupcaps = {
				crumbly = {times={[1] = digtime, [2] = digtime, [3] = digtime}, uses = 0, maxlevel = 3},
				cracky = {times={[1] = digtime, [2] = digtime, [3] = digtime}, uses = 0, maxlevel = 3},
				snappy = {times={[1] = digtime, [2] = digtime, [3] = digtime}, uses = 0, maxlevel = 3},
				choppy = {times={[1] = digtime, [2] = digtime, [3] = digtime}, uses = 0, maxlevel = 3},
				oddly_breakable_by_hand = {times={[1] = digtime, [2] = digtime, [3] = digtime}, uses = 0, maxlevel=3},
			},
			damage_groups = {fleshy = 10},
		}
	})
end

-- Picks

core.register_tool("default:pick_wood", {
	description = "Wooden Pickaxe",
	inventory_image = "default_tool_woodpick.png",
	wield_scale = {x = 1.32, y = 1.55, z = 1.1},
	tool_capabilities = {
		full_punch_interval = 1.2,
		max_drop_level=0,
		groupcaps={
			cracky = {times={[3]=1.60}, uses=10, maxlevel=1},
		},
		damage_groups = {fleshy=2},
	},
})

core.register_tool("default:pick_stone", {
	description = "Stone Pickaxe",
	inventory_image = "default_tool_stonepick.png",
	wield_scale = {x = 1.32, y = 1.55, z = 1.1},
	tool_capabilities = {
		full_punch_interval = 1.3,
		max_drop_level=0,
		groupcaps={
			cracky = {times={[2]=2.0, [3]=1.00}, uses=20, maxlevel=1},
		},
		damage_groups = {fleshy=3},
	},
})

core.register_tool("default:pick_steel", {
	description = "Steel Pickaxe",
	inventory_image = "default_tool_steelpick.png",
	wield_scale = {x = 1.32, y = 1.55, z = 1.1},
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			cracky = {times={[1]=4.00, [2]=1.60, [3]=0.80}, uses=20, maxlevel=2},
		},
		damage_groups = {fleshy=4},
	},
})

core.register_tool("default:pick_bronze", {
	description = "Bronze Pickaxe",
	inventory_image = "default_tool_bronzepick.png",
	wield_scale = {x = 1.32, y = 1.55, z = 1.1},
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			cracky = {times={[1]=4.00, [2]=1.60, [3]=0.80}, uses=30, maxlevel=2},
		},
		damage_groups = {fleshy=4},
	},
})

core.register_tool("default:pick_mese", {
	description = "Mese Pickaxe",
	inventory_image = "default_tool_mesepick.png",
	wield_scale = {x = 1.32, y = 1.55, z = 1.1},
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=3,
		groupcaps={
			cracky = {times={[1]=2.4, [2]=1.2, [3]=0.60}, uses=20, maxlevel=3},
		},
		damage_groups = {fleshy=5},
	},
})

core.register_tool("default:pick_diamond", {
	description = "Diamond Pickaxe",
	inventory_image = "default_tool_diamondpick.png",
	wield_scale = {x = 1.32, y = 1.55, z = 1.1},
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=3,
		groupcaps={
			cracky = {times={[1]=2.0, [2]=1.0, [3]=0.50}, uses=30, maxlevel=3},
		},
		damage_groups = {fleshy=5},
	},
})


-- Shovels

core.register_tool("default:shovel_wood", {
	description = "Wooden Shovel",
	inventory_image = "default_tool_woodshovel.png",
	wield_image = "default_tool_woodshovel.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 1.2,
		max_drop_level=0,
		groupcaps={
			crumbly = {times={[1]=3.00, [2]=1.60, [3]=0.60}, uses=10, maxlevel=1},
		},
		damage_groups = {fleshy=2},
	},
})

core.register_tool("default:shovel_stone", {
	description = "Stone Shovel",
	inventory_image = "default_tool_stoneshovel.png",
	wield_image = "default_tool_stoneshovel.png^[transformR90",
	wield_scale = {x = 1.75, y = 1.55, z = 1},
	tool_capabilities = {
		full_punch_interval = 1.4,
		max_drop_level=0,
		groupcaps={
			crumbly = {times={[1]=1.80, [2]=1.20, [3]=0.50}, uses=20, maxlevel=1},
		},
		damage_groups = {fleshy=2},
	},
})

core.register_tool("default:shovel_steel", {
	description = "Steel Shovel",
	inventory_image = "default_tool_steelshovel.png",
	wield_image = "default_tool_steelshovel.png^[transformR90",
	wield_scale = {x = 1.75, y = 1.55, z = 1},
	tool_capabilities = {
		full_punch_interval = 1.1,
		max_drop_level=1,
		groupcaps={
			crumbly = {times={[1]=1.50, [2]=0.90, [3]=0.40}, uses=30, maxlevel=2},
		},
		damage_groups = {fleshy=3},
	},
})

core.register_tool("default:shovel_bronze", {
	description = "Bronze Shovel",
	inventory_image = "default_tool_bronzeshovel.png",
	wield_image = "default_tool_bronzeshovel.png^[transformR90",
	wield_scale = {x = 1.75, y = 1.55, z = 1},
	tool_capabilities = {
		full_punch_interval = 1.1,
		max_drop_level=1,
		groupcaps={
			crumbly = {times={[1]=1.50, [2]=0.90, [3]=0.40}, uses=40, maxlevel=2},
		},
		damage_groups = {fleshy=3},
	},
})

core.register_tool("default:shovel_mese", {
	description = "Mese Shovel",
	inventory_image = "default_tool_meseshovel.png",
	wield_image = "default_tool_meseshovel.png^[transformR90",
	wield_scale = {x = 1.75, y = 1.55, z = 1},
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=3,
		groupcaps={
			crumbly = {times={[1]=1.20, [2]=0.60, [3]=0.30}, uses=20, maxlevel=3},
		},
		damage_groups = {fleshy=4},
	},
})

core.register_tool("default:shovel_diamond", {
	description = "Diamond Shovel",
	inventory_image = "default_tool_diamondshovel.png",
	wield_image = "default_tool_diamondshovel.png^[transformR90",
	wield_scale = {x = 1.75, y = 1.55, z = 1},
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			crumbly = {times={[1]=1.10, [2]=0.50, [3]=0.30}, uses=30, maxlevel=3},
		},
		damage_groups = {fleshy=4},
	},
})


-- Axes

core.register_tool("default:axe_wood", {
	description = "Wooden Axe",
	inventory_image = "default_tool_woodaxe.png",
	wield_scale = {x = 1.5, y = 1.5, z = 1},
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=0,
		groupcaps={
			choppy = {times={[2]=3.00, [3]=1.60}, uses=10, maxlevel=1},
		},
		damage_groups = {fleshy=2},
	},
})

core.register_tool("default:axe_stone", {
	description = "Stone Axe",
	inventory_image = "default_tool_stoneaxe.png",
	wield_scale = {x = 1.5, y = 1.5, z = 1},
	tool_capabilities = {
		full_punch_interval = 1.2,
		max_drop_level=0,
		groupcaps={
			choppy={times={[1]=3.00, [2]=2.00, [3]=1.30}, uses=20, maxlevel=1},
		},
		damage_groups = {fleshy=3},
	},
})

core.register_tool("default:axe_steel", {
	description = "Steel Axe",
	inventory_image = "default_tool_steelaxe.png",
	wield_scale = {x = 1.5, y = 1.5, z = 1},
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=2.50, [2]=1.40, [3]=1.00}, uses=20, maxlevel=2},
		},
		damage_groups = {fleshy=4},
	},
})

core.register_tool("default:axe_bronze", {
	description = "Bronze Axe",
	inventory_image = "default_tool_bronzeaxe.png",
	wield_scale = {x = 1.5, y = 1.5, z = 1},
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=2.50, [2]=1.40, [3]=1.00}, uses=30, maxlevel=2},
		},
		damage_groups = {fleshy=4},
	},
})

core.register_tool("default:axe_mese", {
	description = "Mese Axe",
	inventory_image = "default_tool_meseaxe.png",
	wield_scale = {x = 1.5, y = 1.5, z = 1},
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=2.20, [2]=1.00, [3]=0.60}, uses=20, maxlevel=3},
		},
		damage_groups = {fleshy=6},
	},
})

core.register_tool("default:axe_diamond", {
	description = "Diamond Axe",
	inventory_image = "default_tool_diamondaxe.png",
	wield_scale = {x = 1.5, y = 1.5, z = 1},
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=2.10, [2]=0.90, [3]=0.50}, uses=30, maxlevel=2},
		},
		damage_groups = {fleshy=7},
	},
})

-- Shears
core.register_tool("default:shears", {
	description = "Shears",
	inventory_image = "default_shears.png",
	wield_scale = {x = 1.5, y = 1.5, z = 1},
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level = 1,
		groupcaps = {
			snappy = {times = {[1] = 0.4, [2] = 0.2, [3] = 0.1}, uses = 25, maxlevel = 2}
		},
	},
})

-- Screwdriver
core.register_tool("default:screwdriver", {
	description = "Screwdriver (left-click rotates face, right-click rotates axis)",
	inventory_image = "default_screwdriver.png",
	on_use = function(itemstack, user, pointed_thing)
		screwdriver.screwdriver_handler(itemstack, user, pointed_thing, screwdriver.ROTATE_FACE)
		return itemstack
	end,
	on_place = function(itemstack, user, pointed_thing)
		screwdriver.screwdriver_handler(itemstack, user, pointed_thing, screwdriver.ROTATE_AXIS)
		return itemstack
	end,
})
