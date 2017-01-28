--[[
mods/default/lua/apis/furniture.lua
===================================
Furniture API

Parts of the of the Chair API are from kilbith's 'X-Decor' mod (GPLv3).
See https://github.com/minetest-mods/xdecor for details.

Copyright (C) 2015-2016 LNJ <git@lnj.li>
Copyright (C) 2015-2016 kilbith <jeanpatrick.guerrero@gmail.com>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
]]

--
-- Chair
--

local function chair_sit(pos, node, clicker, pointed_thing)
	-- no player, no sitting
	if not clicker or not clicker:is_player() then return end
	-- if the pointed_thing is missing, abort
	if not pointed_thing then return end
	-- if the chair is wrong rotated, abort
	if pointed_thing.above.y < pointed_thing.under.y then return end

	-- if another player already sits here, abort
	local player_name = clicker:get_player_name()
	local objs = core.get_objects_inside_radius(pos, 0.1)
	local vel = clicker:get_player_velocity()
	local ctrl = clicker:get_player_control()
	local occupied = false

	for _, obj in pairs(objs) do
		-- if there is a player that has another name than we
		if obj:is_player() and obj:get_player_name() ~= player_name then
			return
		end
	end

	-- no other players found

	if default.player_attached[player_name] then
		-- if player already sits, stand up
		pos.y = pos.y - 0.5
		clicker:setpos(pos)
		clicker:set_eye_offset({x=0, y=0, z=0}, {x=0, y=0, z=0})
		clicker:set_physics_override(1, 1, 1)
		default.player_attached[player_name] = false
		default.player_set_animation(clicker, "stand")

	elseif not default.player_attached[player_name] and node.param2 <= 3 and
		not ctrl.sneak and vector.equals(vel, {x=0,y=0,z=0}) then

		-- if player is not sitting, sit down
		clicker:set_eye_offset({x=0, y=-7, z=2}, {x=0, y=0, z=0})
		clicker:set_physics_override(0, 0, 0)
		clicker:setpos(pos)
		default.player_attached[player_name] = true
		default.player_set_animation(clicker, "sit")

		if     node.param2 == 0 then clicker:set_look_yaw(3.15)
		elseif node.param2 == 1 then clicker:set_look_yaw(7.9)
		elseif node.param2 == 2 then clicker:set_look_yaw(6.28)
		elseif node.param2 == 3 then clicker:set_look_yaw(4.75) end
	end
end

local function chair_can_dig(pos, digger)
	for _, player in pairs(core.get_objects_inside_radius(pos, 0.1)) do
		if player:is_player() and default.player_attached[player:get_player_name()] then
			return false
		end
	end
	return true
end

function default.register_chair(name, def)
	def.drawtype = def.drawtype or "nodebox"
	def.paramtype = "light"
	def.paramtype2 = "facedir"
	def.legacy_facedir = true
	def.tiles = def.tiles or {def.texture}
	def.on_rotate = screwdriver.rotate_simple
	def.node_box = def.node_box or {
		type = "fixed",
		fixed = {
			{-0.3125, -0.5, 0.1875, -0.1875, 0.5, 0.3125},
			{0.1875, -0.5, 0.1875, 0.3125, 0.5, 0.3125},
			{-0.1875, 0.0625, 0.21875, 0.1875, 0.4375, 0.28125},
			{-0.3125, -0.5, -0.3125, -0.1875, -0.125, -0.1875},
			{0.1875, -0.5, -0.3125, 0.3125, -0.125, -0.1875},
			{-0.3125, -0.125, -0.3125, 0.3125, 0, 0.1875}
		}
	}
	def.can_dig = chair_can_dig
	def.is_ground_content = false
	def.on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
		pos.y = pos.y + tonumber(def.sitting_pos or 0)
		chair_sit(pos, node, clicker, pointed_thing)
		return itemstack
	end

	def.groups = def.groups or {oddly_breakable_by_hand = 2, choppy = 2,
					fuel = 6, flammable = 2}
	def.groups.chair = 1
	def.sounds = def.sounds or default.node_sound_wood_defaults()

	-- remove the material from the nodedef
	local material = def.material
	def.material = nil

	-- register the node
	core.register_node(name, def)

	-- register crafting recipe
	if not def.no_craft then
		core.register_craft({
			output = name .. " 3",
			recipe = {
				{   material,       ""       },
				{   material,     material   },
				{"group:stick", "group:stick"},
			}
		})
	end
end


--
-- Table
--

function default.register_table(name, def)
	local material = def.material

	-- set defaults if nothing is set
	def.groups = def.groups or {choppy = 2, flammable = 2, oddly_breakable_by_hand = 2, fuel = 8}
	def.sounds = def.sounds or default.node_sound_wood_defaults()

	-- set table properties
	def.paramtype = "light"
	def.drawtype = "nodebox"
	def.node_box = {
		type = "fixed",
		fixed = {
			{-0.5, 0.375, -0.5, 0.5, 0.5, 0.5},
			{-0.1875, -0.5, -0.1875, 0.1875, 0.375, 0.1875}
		}
	}

	-- clean up variables
	def.material = nil

	-- register the table
	core.register_node(name, def)

	-- and register the crafting recipe
	if not def.no_craft then
		core.register_craft({
			output = name .. " 4",
			recipe = {
				{material, material, material},
				{   "",    material,    ""   },
				{   "",    material,    ""   },
			}
		})
	end
end
