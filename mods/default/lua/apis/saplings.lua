function default.register_sapling(name, def)
	local growtime = def.growtime * default.GROW_TIME_FACTOR
	local on_grow = def.on_grow or default.grow_sapling
	
	def.drawtype = "plantlike"
	def.tiles = def.tiles or {def.texture}
	def.inventory_image = def.texture or def.tiles[1]
	def.wield_image = def.texture or def.tiles[1]
	def.paramtype = "light"
	def.sunlight_propagates = true
	def.walkable = false
	def.groups = def.groups or {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1}
	def.sounds = def.sounds or default.node_sound_leaves_defaults()
	def.on_construct = function(pos)
		local timer = core.get_node_timer(pos)
		timer:start(math.random(growtime * 0.6, growtime * 1.8))
	end
	def.on_timer = function(pos, elapsed)
		if on_grow(pos, core.get_node(pos)) == false then
			-- if the grow failed then retry after shorter time
			core.get_node_timer(pos):start(growtime * 0.2)
		end
	end
	def.selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.35, 0.3}
	}
	
	def.growtime = nil
	def.texture = nil
	def.on_grow = nil
	
	default.register_node(name, def)
end
