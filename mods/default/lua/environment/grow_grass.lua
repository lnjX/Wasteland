-- mods/default/lua/environment/grow_grass.lua
-- ===========================================
-- See README.txt for licensing and other information.
 
-- Grass
core.register_abm({
	nodenames = {"default:dirt"},
	interval = 2,
	chance = 200,
	action = function(pos, node)
		local above = {x = pos.x, y = pos.y + 1, z = pos.z}
		local name = core.get_node(above).name
		local nodedef = core.registered_nodes[name]
		if nodedef and (nodedef.sunlight_propagates or nodedef.paramtype == "light") and
				nodedef.liquidtype == "none" and
				(core.get_node_light(above) or 0) >= 13 then
			if name == "default:snow" or name == "default:snowblock" then
				core.set_node(pos, {name = "default:dirt_with_snow"})
			else
				core.set_node(pos, {name = "default:dirt_with_grass"})
			end
		end
	end
})

-- Remove grass
core.register_abm({
	nodenames = {"default:dirt_with_grass", "default:dirt_with_dry_grass"},
	interval = 2,
	chance = 20,
	action = function(pos, node)
		local above = {x = pos.x, y = pos.y + 1, z = pos.z}
		local name = core.get_node(above).name
		local nodedef = core.registered_nodes[name]
		if name ~= "ignore" and nodedef and not ((nodedef.sunlight_propagates or
				nodedef.paramtype == "light") and
				nodedef.liquidtype == "none") then
			core.set_node(pos, {name = "default:dirt"})
		end
	end
})
