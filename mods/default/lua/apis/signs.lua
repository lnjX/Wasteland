-- mods/default/lua/apis/signs.lua
-- ===============================
-- See README.txt for licensing and other information.

function default.register_sign(name, def)
	def.drawtype = "nodebox"
	def.tiles = {def.texture_wall}
	def.inventory_image = def.texture
	def.wield_image = def.texture
	def.paramtype = "light"
	def.paramtype2 = "wallmounted"
	def.sunlight_propagates = true
	def.is_ground_content = false
	def.walkable = false
	def.legacy_wallmounted = true
	def.node_box = {
		type = "wallmounted",
		wall_top    = {-0.4375, 0.4375, -0.3125, 0.4375, 0.5, 0.3125},
		wall_bottom = {-0.4375, -0.5, -0.3125, 0.4375, -0.4375, 0.3125},
		wall_side   = {-0.5, -0.3125, -0.4375, -0.4375, 0.3125, 0.4375},
	}
	def.on_construct = function(pos)
		local meta = core.get_meta(pos)
		meta:set_string("formspec", "field[text;;${text}]")
		meta:set_string("infotext", "\"\"")
	end
	def.on_receive_fields = function(pos, formname, fields, sender)
		local player_name = sender:get_player_name()
		if core.is_protected(pos, player_name) then
			core.record_protection_violation(pos, player_name)
			return
		end
		local meta = core.get_meta(pos)
		if not fields.text then return end
		core.log("action", (player_name or "") .. " wrote \"" ..
			fields.text .. "\" to sign at " .. core.pos_to_string(pos))
		meta:set_string("text", fields.text)
		meta:set_string("infotext", '"' .. fields.text .. '"')
	end
	def.groups = def.groups or {}
	def.groups.attached_node = 1
	def.groups.sign = 1
	
	-- clean up vars
	def.texture_wall = nil
	def.texture = nil
	
	core.register_node(name, def)
end

