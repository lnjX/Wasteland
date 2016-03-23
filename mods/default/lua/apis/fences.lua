function default.register_fence(itemstring, def)
	local fence_texture_1 = "default_fence_overlay.png^"
	local fence_texture_2 = "^default_fence_overlay.png^[makealpha:255,126,126"

	if not def.groups then
		def.groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, fuel = 4}
	end
	if not def.sounds then
		def.sounds = default.node_sound_wood_defaults()
	end

	def.groups.fence = 1

	core.register_node(itemstring, {
		description = def.description,
		drawtype = "fencelike",
		tiles = {def.texture},
		inventory_image = fence_texture_1 .. def.texture .. fence_texture_2,
		wield_image = fence_texture_1 .. def.texture .. fence_texture_2,
		paramtype = "light",
		sunlight_propagates = true,
		is_ground_content = false,
		selection_box = {
			type = "fixed",
			fixed = {-1/7, -1/2, -1/7, 1/7, 1/2, 1/7},
		},
		groups = def.groups,
		sounds = def.sounds,
	})

	if not def.no_craft then
		core.register_craft({
			output = itemstring .. " 6",
			recipe = {
				{def.material, "group:stick", def.material},
				{def.material, "group:stick", def.material},
			}
		})
	end
end

default.register_fence("default:fence_wood", {
	description = "Wooden Fence",
	texture = "default_wood.png",
	material = "default:wood"
})

default.register_fence("default:fence_junglewood", {
	description = "Junglewood Fence",
	texture = "default_junglewood.png",
	material = "default:junglewood"
})

default.register_fence("default:fence_pine_wood", {
	description = "Pine Wood Fence",
	texture = "default_pine_wood.png",
	material = "default:pinewood"
})

default.register_fence("default:fence_acacia_wood", {
	description = "Acacia Wood Fence",
	texture = "default_acacia_wood.png",
	material = "default:acacia_wood"
})

default.register_fence("default:fence_birch_wood", {
	description = "Birch Wood Fence",
	texture = "default_birch_wood.png",
	material = "default:birch_wood"
})

default.register_fence("default:fence_papyrus", {
	description = "Papyrus Fence",
	texture = "default_papyrus_block_top.png",
	no_craft = true,
        -- the crafting recipe is in mods/default/lua/crafting.lua
	groups = {choppy = 3, oddly_breakable_by_hand = 3, flammable = 2, fuel = 16, fence = 1},
	sounds = default.node_sound_leaves_defaults()
})


local compatible = core.setting_getbool("enable_support_old_versions") or true
if compatible then
	-- these nodes were named wrong first
	core.register_alias("default:fence_pinewood", "default:fence_pine_wood")
	core.register_alias("default:fence_acaciawood", "default:fence_acacia_wood")
	core.register_alias("default:fence_birchwood", "default:fence_birch_wood")
end