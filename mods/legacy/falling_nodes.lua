-- mods/legacy/falling_node.lua
-- ============================
-- See README.txt for licensing and other information.

-- Horrible crap to support old code registering falling nodes
-- Don't use this and never do what this does, it's completely wrong!
-- (More specifically, the client and the C++ code doesn't get the group)
function default.register_falling_node(nodename, texture)
	core.log("error", debug.traceback())
	core.log('error', "WARNING: default.register_falling_node is deprecated")
	if core.registered_nodes[nodename] then
		core.registered_nodes[nodename].groups.falling_node = 1
	end
end

function default.spawn_falling_node(p, nodename)
	spawn_falling_node(p, nodename)
end
