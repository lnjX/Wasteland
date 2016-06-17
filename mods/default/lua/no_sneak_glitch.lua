-- mods/default/lua/no_sneak_glitch.lua
-- ====================================
-- See README.txt for licensing and other information.

core.register_on_joinplayer(function(player)
	player:set_physics_override({sneak_glitch=false})
end)
