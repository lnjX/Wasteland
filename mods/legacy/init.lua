-- mods/legacy/init.lua
-- ====================
-- See README.txt for licensing anf other information.

legacy = {}

local modpath = core.get_modpath("legacy") .. "/"

dofile(modpath .. "functions.lua")
dofile(modpath .. "aliases.lua")
dofile(modpath .. "dyes.lua")
dofile(modpath .. "falling_nodes.lua")
dofile(modpath .. "stairs.lua")
dofile(modpath .. "trees.lua")

--
-- Other
--

-- Liquids
WATER_ALPHA = core.registered_nodes["default:water_source"].alpha
WATER_VISC = core.registered_nodes["default:water_source"].liquid_viscosity
LAVA_VISC = core.registered_nodes["default:lava_source"].liquid_viscosity
LIGHT_MAX = default.LIGHT_MAX

-- Formspecs
default.gui_suvival_form = default.gui_survival_form
