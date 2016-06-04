<<<<<<< HEAD
-- Minetest 0.4 mod: bucket
-- See README.txt for licensing and other information.

local LIQUID_MAX = 8  --The number of water levels when liquid_finite is enabled

minetest.register_alias("bucket", "bucket:bucket_empty")
minetest.register_alias("bucket_water", "bucket:bucket_water")
minetest.register_alias("bucket_lava", "bucket:bucket_lava")

minetest.register_craft({
	output = 'bucket:bucket_empty 1',
	recipe = {
		{'default:steel_ingot', '', 'default:steel_ingot'},
		{'', 'default:steel_ingot', ''},
	}
})

bucket = {}
bucket.liquids = {}
=======
bucket = {}
bucket.liquids = {}

local function check_protection(pos, name, text)
	if minetest.is_protected(pos, name) then
		minetest.log("action", (name ~= "" and name or "A mod")
			.. " tried to " .. text
			.. " at protected position "
			.. minetest.pos_to_string(pos)
			.. " with a bucket")
		minetest.record_protection_violation(pos, name)
		return true
	end
	return false
end

local function place_liquid(pos, node, user, source, flowing)
	if check_protection(pos, user and user:get_player_name() or "",
			"place " .. source) or node.name == source then
		return
	end
	minetest.add_node(pos, {name = source})
end

local function check_rightclick(ndef, node, user, pointed_thing, itemstack)
	-- Call on_rightclick if the pointed node defines it
	if ndef and ndef.on_rightclick and
		 user and not user:get_player_control().sneak then
		return ndef.on_rightclick(
			pointed_thing.under,
			node, user,
			itemstack) or itemstack
	end
end
>>>>>>> e27abaef044c593f710cc8520ba9fd8f0c6b3379

-- Register a new liquid
--   source = name of the source node
--   flowing = name of the flowing node
--   itemname = name of the new bucket item (or nil if liquid is not takeable)
--   inventory_image = texture of the new bucket item (ignored if itemname == nil)
<<<<<<< HEAD
-- This function can be called from any mod (that depends on bucket).
function bucket.register_liquid(source, flowing, itemname, inventory_image, name)
=======
--   groups = (optional) groups of the bucket item, for example {water_bucket = 1}
-- This function can be called from any mod (that depends on bucket).
function bucket.register_liquid(source, flowing, itemname, inventory_image, name, groups)
>>>>>>> e27abaef044c593f710cc8520ba9fd8f0c6b3379
	bucket.liquids[source] = {
		source = source,
		flowing = flowing,
		itemname = itemname,
	}
	bucket.liquids[flowing] = bucket.liquids[source]

	if itemname ~= nil then
<<<<<<< HEAD
		minetest.register_craftitem(itemname, {
			description = name,
			inventory_image = inventory_image,
			stack_max = 1,
			liquids_pointable = true,
			groups = {not_in_creative_inventory=1},
=======
		default.register_craftitem(itemname, {
			description = name,
			inventory_image = inventory_image,
			stack_max = 1,
			groups = groups or {bucket = 1},
>>>>>>> e27abaef044c593f710cc8520ba9fd8f0c6b3379
			on_place = function(itemstack, user, pointed_thing)
				-- Must be pointing to node
				if pointed_thing.type ~= "node" then
					return
				end
<<<<<<< HEAD
				
				-- Call on_rightclick if the pointed node defines it
				if user and not user:get_player_control().sneak then
					local n = minetest.get_node(pointed_thing.under)
					local nn = n.name
					if minetest.registered_nodes[nn] and minetest.registered_nodes[nn].on_rightclick then
						return minetest.registered_nodes[nn].on_rightclick(pointed_thing.under, n, user, itemstack) or itemstack
					end
				end

				local place_liquid = function(pos, node, source, flowing, fullness)
					if math.floor(fullness/128) == 1 or (not minetest.setting_getbool("liquid_finite")) then
						minetest.add_node(pos, {name=source, param2=fullness})
						return
					elseif node.name == flowing then
						fullness = fullness + node.param2
					elseif node.name == source then
						fullness = LIQUID_MAX
					end

					if fullness >= LIQUID_MAX then
						minetest.add_node(pos, {name=source, param2=LIQUID_MAX})
					else
						minetest.add_node(pos, {name=flowing, param2=fullness})
					end
				end

				-- Check if pointing to a buildable node
				local node = minetest.get_node(pointed_thing.under)
				local fullness = tonumber(itemstack:get_metadata())
				if not fullness then fullness = LIQUID_MAX end

				if minetest.registered_nodes[node.name].buildable_to then
					-- buildable; replace the node
					place_liquid(pointed_thing.under, node, source, flowing, fullness)
				else
					-- not buildable to; place the liquid above
					-- check if the node above can be replaced
					local node = minetest.get_node(pointed_thing.above)
					if minetest.registered_nodes[node.name].buildable_to then
						place_liquid(pointed_thing.above, node, source, flowing, fullness)
					else
						-- do not remove the bucket with the liquid
						return
					end
				end
				return {name="bucket:bucket_empty"}
=======

				local above_node = minetest.get_node_or_nil(pointed_thing.above)
				local under_node = minetest.get_node_or_nil(pointed_thing.under)
				local na_def = minetest.registered_nodes[above_node.name]
				local nu_def = minetest.registered_nodes[under_node.name]


				local abort = check_rightclick(nu_def, under_node, user, pointed_thing, itemstack)
				if abort then
					return abort
				end

				-- Check if pointing to a buildable node
				if na_def and na_def.buildable_to and (na_def.liquidtype == "none" or
				 		source == na_def.liquid_alternative_source) then
					place_liquid(pointed_thing.above, above_node, user,	source, flowing)
				else
					-- do not remove the bucket with the liquid
					return
				end
				local retval = {name = "bucket:bucket_empty"}
				if minetest.setting_getbool("creative_mode") == true then
					retval = nil
				end
				return retval
>>>>>>> e27abaef044c593f710cc8520ba9fd8f0c6b3379
			end
		})
	end
end

<<<<<<< HEAD
minetest.register_craftitem("bucket:bucket_empty", {
	description = "Empty Bucket",
	inventory_image = "bucket.png",
	stack_max = 99,
	liquids_pointable = true,
	on_use = function(itemstack, user, pointed_thing)
=======
default.register_craftitem("bucket:bucket_empty", {
	description = "Empty Bucket",
	inventory_image = "bucket.png",
	stack_max = 99,
	on_place = function(itemstack, user, pointed_thing)
>>>>>>> e27abaef044c593f710cc8520ba9fd8f0c6b3379
		-- Must be pointing to node
		if pointed_thing.type ~= "node" then
			return
		end
<<<<<<< HEAD
		-- Check if pointing to a liquid source
		node = minetest.get_node(pointed_thing.under)
		liquiddef = bucket.liquids[node.name]
		if liquiddef ~= nil and liquiddef.itemname ~= nil and (node.name == liquiddef.source or
			(node.name == liquiddef.flowing and minetest.setting_getbool("liquid_finite"))) then

			minetest.add_node(pointed_thing.under, {name="air"})

			if node.name == liquiddef.source then node.param2 = LIQUID_MAX end
			return ItemStack({name = liquiddef.itemname, metadata = tostring(node.param2)})
=======

		local above_node = minetest.get_node_or_nil(pointed_thing.above)
		local under_node = minetest.get_node_or_nil(pointed_thing.under)
		local na_def = minetest.registered_nodes[above_node.name]
		local nu_def = minetest.registered_nodes[under_node.name]

		local abort = check_rightclick(nu_def, under_node, user, pointed_thing, itemstack)
		if abort then
			return abort
		end

		local liquiddef = bucket.liquids[above_node.name]
		local item_count = user:get_wielded_item():get_count()

		if liquiddef ~= nil
		and liquiddef.itemname ~= nil
		and above_node.name == liquiddef.source then
			if check_protection(pointed_thing.above,
					user:get_player_name(),
					"take " .. above_node.name) then
				return
			end

			-- default set to return filled bucket
			local giving_back = liquiddef.itemname

			-- check if holding more than 1 empty bucket
			if item_count > 1 then

				-- if space in inventory add filled bucked, otherwise drop as item
				local inv = user:get_inventory()
				if inv:room_for_item("main", {name = liquiddef.itemname}) then
					inv:add_item("main", liquiddef.itemname)
				else
					local pos = user:getpos()
					pos.y = math.floor(pos.y + 0.5)
					core.add_item(pos, liquiddef.itemname)
				end

				-- set to return empty buckets minus 1
				giving_back = "bucket:bucket_empty " .. tostring(item_count-1)

			end

			minetest.add_node(pointed_thing.above, {name = "air"})

			local retval = ItemStack(giving_back)
			if minetest.setting_getbool("creative_mode") == true then
				retval = itemstack
			end
			return retval
>>>>>>> e27abaef044c593f710cc8520ba9fd8f0c6b3379
		end
	end,
})

<<<<<<< HEAD
=======

-- Register buckets
>>>>>>> e27abaef044c593f710cc8520ba9fd8f0c6b3379
bucket.register_liquid(
	"default:water_source",
	"default:water_flowing",
	"bucket:bucket_water",
	"bucket_water.png",
	"Water Bucket"
)

bucket.register_liquid(
	"default:lava_source",
	"default:lava_flowing",
	"bucket:bucket_lava",
	"bucket_lava.png",
<<<<<<< HEAD
	"Lava Bucket"
)

minetest.register_craft({
	type = "fuel",
	recipe = "bucket:bucket_lava",
	burntime = 60,
	replacements = {{"bucket:bucket_lava", "bucket:bucket_empty"}},
})

minetest.register_craftitem("bucket:bucket_snow", {
	description = "Bucket with Snow",
	inventory_image = "bucket_snow.png",
	groups = {not_in_creative_inventory=1},
	stack_max = 1,
	liquids_pointable = false,
	on_use = function(itemstack, user, pointed_thing)
		-- Must be pointing to node
		if pointed_thing.type ~= "node" then
			return
		end
		-- Check if is buildable to
		local p = pointed_thing.above
		node = minetest.get_node(p)
		local def = minetest.registered_items[node.name]
		if def ~= nil and def.buildable_to then
			local cnt = 0
			for iz = -1,1,1 do
			for ix = -1,1,1 do
				local np = {x=p.x+ix,y=p.y,z=p.z+iz}
				local n = minetest.get_node(np)
				local n_def = minetest.registered_items[n.name]
				if n_def ~= nil and n_def.buildable_to and cnt < 8 then
					minetest.set_node(np, {name="default:snow"})
					cnt = cnt+1
					nodeupdate(np)
				end
			end
			end
			return {name = "bucket:bucket_empty"}
		end
	end,
})

minetest.register_craft({
        output = 'bucket:bucket_snow',
        recipe = {
                {'default:snow', 'default:snow', 'default:snow'},
                {'default:snow', 'bucket:bucket_empty', 'default:snow'},
                {'default:snow', 'default:snow', 'default:snow'},
        }
})

minetest.register_craft({
        type = "cooking",
        output = "bucket:bucket_water",
        recipe = "bucket:bucket_snow",
})

=======
	"Lava Bucket",
	{bucket = 1, fuel = 60}
)

minetest.register_craft({
	output = 'bucket:bucket_empty 1',
	recipe = {
		{'default:steel_ingot', '', 'default:steel_ingot'},
		{'', 'default:steel_ingot', ''},
	}
})

minetest.register_alias("bucket", "bucket:bucket_empty")
minetest.register_alias("bucket_water", "bucket:bucket_water")
minetest.register_alias("bucket_lava", "bucket:bucket_lava")
>>>>>>> e27abaef044c593f710cc8520ba9fd8f0c6b3379
