function default.register_carpet(name, def)
	def.tiles = def.tiles or {def.texture}
	def.drawtype = "nodebox"
	def.is_ground_content = false
	def.paramtype = "light"
	def.node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5,  0.5, -0.4, 0.5}
		}
	}
	def.groups = def.groups or {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3, flammable = 3, carpet = 1, attached_node = 1}
	def.sounds = def.sounds or default.node_sound_defaults()
	
	def.register = nil
	
	default.register_node(name, def)
end
