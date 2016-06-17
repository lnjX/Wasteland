-- Minetest TNG mod: default
-- =========================
-- See README.txt for licensing and other information.

default = {}

function default.get_difficult_and_set(easy, normal, hard)
	local difficults = {}
	difficults["easy"] = easy
	difficults["normal"] = normal
	difficults["hard"] = hard
	return difficults[core.setting_get("difficulty") or "normal"]
end

-- Global variables
default.NAME = "tng"
default.LIGHT_MAX = 14
default.STACK_MAX = core.setting_get("default_stack_max") or 100
default.GROW_TIME_FACTOR = default.get_difficult_and_set(0.8, 1.0, 1.4)

-- default settings (for nodes, items)
core.craftitemdef_default.stack_max =  default.STACK_MAX
core.nodedef_default.stack_max =       default.STACK_MAX
core.noneitemdef_default.stack_max =   default.STACK_MAX


-- this does everything else in this mod
dofile(core.get_modpath("default") .. "/lua/init.lua")
