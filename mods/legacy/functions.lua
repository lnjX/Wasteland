-- mods/legacy/functions.lua
-- =========================
-- See README.txt for licensing anf other information.

function legacy.register_replace(oldname, newname)
	core.register_lbm({
		name = ":" .. oldname .. "_replace",
		nodenames = {oldname},
		action = function(pos, node)
			core.set_node(pos, {name = newname})
		end
	})
end

function legacy.register_stair_replace(oldname, newname)
	core.register_lbm({
		name = ":" .. oldname .. "_replace",
		nodenames = {oldname},
		action = function(pos, node)
			local newnode = {name = newname, param2 = node.param2 + 20}

			if newnode.param2 == 21 then
				newnode.param2 = 23
			elseif newnode.param2 == 23 then
				newnode.param2 = 21
			end

			core.set_node(pos, newnode)
		end
	})
end

function legacy.register_entity_remove(entityname)
	core.register_entity(":"..entityname, {
		on_activate = function(self, staticdata)
			self.object:remove()
		end
	})
end
