<<<<<<< HEAD
-- Wear out hoes, place soil
-- TODO Ignore group:flower
farming.hoe_on_use = function(itemstack, user, pointed_thing, uses)
	local pt = pointed_thing
	-- check if pointing at a node
	if not pt then
		return
	end
	if pt.type ~= "node" then
		return
	end

	local under = minetest.get_node(pt.under)
	local p = {x=pt.under.x, y=pt.under.y+1, z=pt.under.z}
	local above = minetest.get_node(p)

	-- return if any of the nodes is not registered
	if not minetest.registered_nodes[under.name] then
		return
	end
	if not minetest.registered_nodes[above.name] then
		return
	end

	-- check if the node above the pointed thing is air
	if above.name ~= "air" then
		return
	end

	-- check if pointing at soil
	if minetest.get_item_group(under.name, "soil") ~= 1 then
		return
	end

	-- check if (wet) soil defined
	local regN = minetest.registered_nodes
	if regN[under.name].soil == nil or regN[under.name].soil.wet == nil or regN[under.name].soil.dry == nil then
		return
	end

	if minetest.is_protected(pt.under, user:get_player_name()) then
		minetest.record_protection_violation(pt.under, user:get_player_name())
		return
	end
	if minetest.is_protected(pt.above, user:get_player_name()) then
		minetest.record_protection_violation(pt.above, user:get_player_name())
		return
	end


	-- turn the node into soil, wear out item and play sound
	minetest.set_node(pt.under, {name = regN[under.name].soil.dry})
	minetest.sound_play("default_dig_crumbly", {
		pos = pt.under,
		gain = 0.5,
	})

	if not minetest.setting_getbool("creative_mode") then
		itemstack:add_wear(65535/(uses-1))
	end
	return itemstack
end

-- Register new hoes
farming.register_hoe = function(name, def)
	-- Check for : prefix (register new hoes in your mod's namespace)
	if name:sub(1, 1) ~= ":" then
		name = ":" .. name
	end
	-- Check def table
	if def.description == nil then
		def.description = "Hoe"
	end
	if def.inventory_image == nil then
		def.inventory_image = "unknown_item.png"
	end
	if def.recipe == nil then
		def.recipe = {
			{"air","air",""},
			{"","group:stick",""},
			{"","group:stick",""}
		}
	end
	if def.max_uses == nil then
		def.max_uses = 30
	end
	-- Register the tool
	minetest.register_tool(name, {
		description = def.description,
		inventory_image = def.inventory_image,
		on_use = function(itemstack, user, pointed_thing)
			return farming.hoe_on_use(itemstack, user, pointed_thing, def.max_uses)
		end
	})
	-- Register its recipe
	if def.material == nil then
		minetest.register_craft({
			output = name:sub(2),
			recipe = def.recipe
		})
	else
		minetest.register_craft({
			output = name:sub(2),
			recipe = {
				{def.material, def.material, ""},
				{"", "group:stick", ""},
				{"", "group:stick", ""}
			}
		})
		-- Reverse Recipe
		minetest.register_craft({
			output = name:sub(2),
			recipe = {
				{"", def.material, def.material},
				{"", "group:stick", ""},
				{"", "group:stick", ""}
			}
		})
	end
end

=======
>>>>>>> e27abaef044c593f710cc8520ba9fd8f0c6b3379
-- Seed placement
farming.place_seed = function(itemstack, placer, pointed_thing, plantname)
	local pt = pointed_thing
	-- check if pointing at a node
	if not pt then
		return
	end
	if pt.type ~= "node" then
		return
	end

<<<<<<< HEAD
	local under = minetest.get_node(pt.under)
	local above = minetest.get_node(pt.above)

	if minetest.is_protected(pt.under, placer:get_player_name()) then
		minetest.record_protection_violation(pt.under, placer:get_player_name())
		return
	end
	if minetest.is_protected(pt.above, placer:get_player_name()) then
		minetest.record_protection_violation(pt.above, placer:get_player_name())
=======
	local under = core.get_node(pt.under)
	local above = core.get_node(pt.above)

	if core.is_protected(pt.under, placer:get_player_name()) then
		core.record_protection_violation(pt.under, placer:get_player_name())
		return
	end
	if core.is_protected(pt.above, placer:get_player_name()) then
		core.record_protection_violation(pt.above, placer:get_player_name())
>>>>>>> e27abaef044c593f710cc8520ba9fd8f0c6b3379
		return
	end


	-- return if any of the nodes is not registered
<<<<<<< HEAD
	if not minetest.registered_nodes[under.name] then
		return
	end
	if not minetest.registered_nodes[above.name] then
=======
	if not core.registered_nodes[under.name] then
		return
	end
	if not core.registered_nodes[above.name] then
>>>>>>> e27abaef044c593f710cc8520ba9fd8f0c6b3379
		return
	end

	-- check if pointing at the top of the node
	if pt.above.y ~= pt.under.y + 1 then
		return
	end

	-- check if you can replace the node above the pointed node
<<<<<<< HEAD
	if not minetest.registered_nodes[above.name].buildable_to then
=======
	if not core.registered_nodes[above.name].buildable_to then
>>>>>>> e27abaef044c593f710cc8520ba9fd8f0c6b3379
		return
	end

	-- check if pointing at soil
<<<<<<< HEAD
	if minetest.get_item_group(under.name, "soil") < 2 then
=======
	if core.get_item_group(under.name, "soil") < 2 then
>>>>>>> e27abaef044c593f710cc8520ba9fd8f0c6b3379
		return
	end

	-- add the node and remove 1 item from the itemstack
<<<<<<< HEAD
	local ndef = core.registered_items[plantname]
	if ndef and not ndef.drawtype then
		plantname = plantname .. "_1"
	end
	minetest.set_node(pt.above, {name = plantname, param2 = 1})
	if not minetest.setting_getbool("creative_mode") then
=======
	core.set_node(pt.above, {name = plantname, param2 = 1})
	
	if not core.setting_getbool("creative_mode") then
>>>>>>> e27abaef044c593f710cc8520ba9fd8f0c6b3379
		itemstack:take_item()
	end
	return itemstack
end

<<<<<<< HEAD
-- Register plants
farming.register_plant = function(name, def)
	local mname = name:split(":")[1]
	local pname = name:split(":")[2]

	-- Check def table
	if not def.description then
		def.description = "Seed"
	end
	if not def.inventory_image then
		def.inventory_image = "unknown_item.png"
	end
	if not def.steps then
		return nil
	end
	if not def.minlight then
		def.minlight = 1
	end
	if not def.maxlight then
		def.maxlight = 14
	end
	if not def.fertility then
		def.fertility = {}
	end
	if def.has_seed ~= false then
		def.has_seed = true
	end


	local g = {seed = 1, snappy = default.dig.leaves, attached_node = 1}
	for k, v in pairs(def.fertility) do
		g[v] = 1
	end

	if def.has_seed then
		-- Register seed
		minetest.register_node(":" .. mname .. ":seed_" .. pname, {
			description = def.description,
			tiles = {def.inventory_image},
			inventory_image = def.inventory_image,
			wield_image = def.inventory_image,
			drawtype = "signlike",
			groups = g,
			paramtype = "light",
			paramtype2 = "wallmounted",
			walkable = false,
			sunlight_propagates = true,
			selection_box = {
				type = "fixed",
				fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
			},
			fertility = def.fertility,
			on_place = function(itemstack, placer, pointed_thing)
				return farming.place_seed(itemstack, placer, pointed_thing, mname .. ":seed_" .. pname)
			end,
			on_use = def.on_use,
		})

		-- Register harvest
		minetest.register_craftitem(":" .. mname .. ":" .. pname, {
			description = pname:gsub("^%l", string.upper),
			inventory_image = mname .. "_" .. pname .. ".png",
		})
	else
		minetest.register_craftitem(":" .. mname .. ":" .. pname, {
			description = def.description,
			tiles = {def.inventory_image},
			inventory_image = def.inventory_image,
			wield_image = def.inventory_image,
			groups = g,
			fertility = def.fertility,
			on_place = function(itemstack, placer, pointed_thing)
				return farming.place_seed(itemstack, placer, pointed_thing, mname .. ":" .. pname)
			end,
			on_use = def.on_use,
		})
	end

	-- Register growing steps
	local max_step = def.steps + 1
	for i = 1,def.steps do
			local drop = def.drop or {
				items = {
					{items = {mname .. ":" .. pname}, rarity = max_step - i},
					{items = {mname .. ":" .. pname}, rarity = (max_step - i) * 2},
					{items = {mname .. ":seed_" .. pname}, rarity = max_step - i},
					{items = {mname .. ":seed_" .. pname}, rarity = (max_step - i) * 2},
				}
			}
			if def.has_seed == false then
				drop.items[3] = {items = {mname .. ":" .. pname}, rarity = (max_step - i) * 4}
				drop.items[4] = {items = {mname .. ":" .. pname}, rarity = (max_step - i) * 6}
			end


		local nodegroups = {snappy = default.dig.leaves, flammable = 2, plant = 1, not_in_creative_inventory = 1, attached_node = 1}
		nodegroups[pname] = i
		minetest.register_node(":" .. mname .. ":" .. pname .. "_" .. i, {
			drawtype = "plantlike",
			waving = 1,
			tiles = {mname .. "_" .. pname .. "_" .. i .. ".png"},
			paramtype = "light",
			walkable = false,
			buildable_to = true,
			drop = drop,
			selection_box = {
				type = "fixed",
				fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
			},
			groups = nodegroups,
			sounds = default.node_sound_leaves_defaults(),
		})
	end

	-- Growing ABM
	minetest.register_abm({
		nodenames = {"group:" .. pname, "group:seed"},
		neighbors = {"group:soil"},
		interval = 90,
		chance = 2,
		action = function(pos, node)
			local plant_height = minetest.get_item_group(node.name, pname)

			-- return if already full grown
			if plant_height == def.steps then
				return
			end

			local node_def = minetest.registered_items[node.name] or nil

			-- grow seed
			if def.has_seed and minetest.get_item_group(node.name, "seed") and node_def.fertility then
				local can_grow = false
				local soil_node = minetest.get_node_or_nil({x = pos.x, y = pos.y - 1, z = pos.z})
				if not soil_node then
					return
				end
				for _, v in pairs(node_def.fertility) do
					if minetest.get_item_group(soil_node.name, v) ~= 0 then
						can_grow = true
					end
				end
				if can_grow then
					minetest.set_node(pos, {name = node.name:gsub("seed_", "") .. "_1"})
				end
				return
			end

			-- check if on wet soil
			pos.y = pos.y - 1
			local n = minetest.get_node(pos)
			if minetest.get_item_group(n.name, "soil") < 3 then
				return
			end
			pos.y = pos.y + 1

			-- check light
			local light_level = minetest.get_node_light(pos)

			if not light_level or light_level < def.minlight or light_level > def.maxlight then
				return
			end

			-- grow
			minetest.set_node(pos, {name = mname .. ":" .. pname .. "_" .. plant_height + 1})
		end
	})

	-- Return definition table
	local retval = {
		seed = mname .. ":seed_" .. pname,
		harvest = mname .. ":" .. pname
	}

	if def.has_seed == false then
		retval = {
			seed = mname .. ":" .. pname,
			harvest = mname .. ":" .. pname
		}
	end
	return retval
=======
function farming.can_grow_crop(pos, cond)
	if not pos or not cond then return false end
	
	-- Soil
	local soilnode = core.get_node_or_nil({x = pos.x, y = pos.y - 1, z = pos.z})
	if not soilnode then return false end
	
	-- Check soil fertility
	local fert = false
	for _, f in pairs(cond.fertility) do
		if core.get_item_group(soilnode.name, f) ~= 0 then
			fert = true
		end
	end
	if fert == false then return false end
	
	-- Check if soil is wet
	if core.get_item_group(soilnode.name, "soil") < 3 then  -- dont grow if on dry soil
		return false
	end
	
	-- Check light
	local light = core.get_node_light(pos)

	if not light or light < cond.light.min or light > cond.light.max then
		return false
	end
	
	--[[
	-- Check heat
	local heat = core.get_heat(pos)
	
	if not heat or heat < cond.heat.min or heat > cond.heat.max then
		return false
	end
	
	-- Check humidity
	local humidity = core.get_humidity(pos)
	
	if not humidity or humidity < cond.humidity.min or humidity > cond.humidity.max then
		return false
	end
	--]]
	
	return true
end

local function start_timer(pos, growtime)
	growtime = growtime * default.GROW_TIME_FACTOR
	
	core.get_node_timer(pos):start(math.random(growtime * 0.6, growtime * 1.8))
end

local function next_step(pos, new_name, growtime, cond)
	if farming.can_grow_crop(pos, cond) == false then
		start_timer(pos, growtime / 3) -- retry; only a third of the normal growing time
		return
	end
	-- update plant
	core.set_node(pos, {name = new_name})
end

function farming.register_crop(name, def)
	if not def.steps or not def.growtime then return false end
	
	def.texture_prefix = def.texture_prefix or "farming_" .. name
	
	def.harvest = def.harvest or {}
	def.seed = def.seed or {}
	def.plant = def.plant or {}
	
	def.cond = def.cond or {}
	def.cond.fertility = def.cond.fertility or {}
	def.cond.light = def.cond.light or {min = 13, max = default.LIGHT_MAX}
-- 	def.cond.heat = def.cond.heat or {min = 30, max = 80}
-- 	def.cond.humidity = def.cond.humidity or {min = 22, max = 95}
	
	if def.has_seed ~= false then def.has_seed = true end
	
	local harvestname = def.harvest.name or "farming:" .. name
	local seedname
	
	if def.has_seed == true then
		seedname = def.seed.name or "farming:" .. name .. "_seed"
	else
		seedname = def.harvest.name or "farming:" .. name
	end
	
	-- +-----------------------------------------------------------------------------+
	-- |                                Plant Steps                                  |
	-- +-----------------------------------------------------------------------------+
	
	local plantdef = {}
	plantdef[0] = def.plant
	
	-- properties for all steps
	plantdef[0].drawtype = "plantlike"
	plantdef[0].waving = 1
	plantdef[0].paramtype = "light"
	plantdef[0].walkable = false
	plantdef[0].buildable_to = true
	plantdef[0].selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
	}
	plantdef[0].sounds = plantdef[0].sounds or default.node_sound_leaves_defaults()
	plantdef[0].groups = plantdef[0].groups or {snappy = 3, flammable = 2, attached_node = 1}
	plantdef[0].groups.plant = 1
	plantdef[0].groups.not_in_creative_inventory = 1
	for k, v in pairs(def.cond.fertility) do
		plantdef[0].groups[v] = 1
	end
	
	
	for i = 1, def.steps do
		local percent = 100 / def.steps * i
		
		-- properties (different from step to step)
		plantdef[i] = table.copy(plantdef[0])
		
		plantdef[i].description = (def.description or "Plant") .. " (" .. percent .. "% Grown)"
		plantdef[i].tiles = {def.texture_prefix .. "_" .. i .. ".png"}
		plantdef[i].groups[name] = i
		
		
		-- growing
		if def.steps == i then -- if already fully grown, do not grow
			plantdef[i].on_timer = nil
			plantdef[i].on_construct = nil
		else
			plantdef[i].on_construct = function(pos)
				start_timer(pos, def.growtime / def.steps)
			end
	
			plantdef[i].on_timer = function(pos, elapsed)
				next_step(pos, "farming:" .. name .. "_" .. i + 1, def.growtime / def.steps, def.cond) -- see above
			end
		end
		
		--
		-- Drop
		--
		
		plantdef[i].drop = {max_items = 4, items = {}}
		
		
		-- ever drop a seed
		table.insert(plantdef[i].drop.items, {items = {seedname}, rarity = 1})
		-- if fully grown
		if def.steps == i then
			-- random a second seed
			table.insert(plantdef[i].drop.items, {items = {seedname}, rarity = 2})
			
			-- harvest
			table.insert(plantdef[i].drop.items, {items = {harvestname}, rarity = 1})
			table.insert(plantdef[i].drop.items, {items = {harvestname}, rarity = 2})
		end
		
		
		core.register_node("farming:" .. name .. "_" .. i, plantdef[i])
	end
	
	
	-- +-----------------------------------------------------------------------------+
	-- |                                 Items                                       |
	-- +-----------------------------------------------------------------------------+
	
	--
	-- Seed
	--
	
	if def.has_seed then
		local seeddef = def.seed
		seeddef.name = nil
		
		-- properties
		seeddef.description = seeddef.description or def.description .. " Seed"
		seeddef.inventory_image = seeddef.inventory_image or def.texture_prefix .. "_seed.png"
		
		seeddef.on_place = function(itemstack, placer, pointed_thing)
			return farming.place_seed(itemstack, placer, pointed_thing, "farming:" .. name .. "_1")
		end
		
		core.register_craftitem(seedname, seeddef)
	end
	
	--
	-- Harvest
	--
	
	local harvestdef = def.harvest

	harvestdef.name = nil

	harvestdef.inventory_image = harvestdef.inventory_image or def.texture_prefix .. ".png"
	harvestdef.description = harvestdef.description or def.description

	if def.harvest_implantable == true or def.has_seed == false then
		harvestdef.on_place = function(itemstack, placer, pointed_thing)
			return farming.place_seed(itemstack, placer, pointed_thing, "farming:" .. name .. "_1")
		end
	end

	core.register_craftitem(harvestname, harvestdef)
	
	--
	-- Crafting
	--
	
	if def.craft_seed_by_harvest == true then
		core.register_craft({
			output = seedname,
			recipe = {
				{harvestname}
			}
		})
	end
>>>>>>> e27abaef044c593f710cc8520ba9fd8f0c6b3379
end
