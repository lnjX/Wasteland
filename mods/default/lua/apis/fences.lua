-- mods/default/apis/fences.lua
-- ============================
-- See README.txt for licensing and other information.

function default.register_fence(itemstring, def)
	local fence_texture_1 = "default_fence_overlay.png^"
	local fence_texture_2 = "^default_fence_overlay.png^[makealpha:255,126,126"

	if not def.groups then
		def.groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, fuel = 3}
	end
	if not def.sounds then
		def.sounds = default.node_sound_wood_defaults()
	end
	def.groups.fence = 1
	def.drawtype = "nodebox"
	def.node_box = {
		type = "connected",
		fixed = {
			{-1/8, -1/2, -1/8, 1/8, 1/2, 1/8}
		},
		connect_front = {
			{-1/16,  1/4, -1/2, 1/16, 7/16, -1/8},
			{-1/16, -1/8, -1/2, 1/16, 1/16, -1/8},
		},
		connect_left = {
			{-1/2,  1/4, -1/16, -1/8, 7/16, 1/16},
			{-1/2, -1/8, -1/16, -1/8, 1/16, 1/16}
		},
		connect_back = {
			{-1/16,  4/16, 1/8, 1/16, 7/16, 1/2},
			{-1/16, -2/16, 1/8, 1/16, 1/16, 1/2}
		},
		connect_right = {
			{1/8,  1/4, -1/16, 1/2, 7/16, 1/16},
			{1/8, -1/8, -1/16, 1/2, 1/16, 1/16}
		},
	}
	def.connects_to = def.connects_to or {"group:fence", "group:fencegate", "group:wood", "group:tree", "group:fences_connect", def.material}
	def.collision_box = {
		type = "connected",
		fixed = {
			{-1/8, -1/2, -1/8, 1/8, 1, 1/8}
		},
		connect_front = {
			{-0.125, -0.5, -0.5, 0.125, 1, -0.125},
		},
		connect_left = {
			{-0.5, -0.5, -0.125, -0.125, 1, 0.125},
		},
		connect_back = {
			{-0.125, -0.5, 0.125, 0.125, 1, 0.5},
		},
		connect_right = {
			{0.125, -0.5, -0.125, 0.5, 1, 0.125},
		},
	}
	def.tiles = def.tiles or {def.texture}
	def.inventory_image = fence_texture_1 .. def.texture .. fence_texture_2
	def.wield_image = fence_texture_1 .. def.texture .. fence_texture_2
	def.paramtype = "light"
	def.sunlight_propagates = true
	def.is_ground_content = false
	def.selection_box = {
			type = "fixed",
			fixed = {-1/7, -1/2, -1/7, 1/7, 1/2, 1/7},
	}

	core.register_node(itemstring, def)

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

-- Old crafting for normal fence

core.register_craft({
	output = "default:fence_wood 2",
	recipe = {
		{"group:stick", "group:stick", "group:stick"},
		{"group:stick", "group:stick", "group:stick"},
	}
})
