-- mods/default/lua/environment/lava_cooling.lua
-- =============================================
-- See README.txt for licensing and other information.

default.cool_lava_source = function(pos)
	core.set_node(pos, {name = "default:obsidian"})
	core.sound_play("default_cool_lava",
		{pos = pos, max_hear_distance = 16, gain = 0.25})
end

default.cool_lava_flowing = function(pos)
	core.set_node(pos, {name = "default:stone"})
	core.sound_play("default_cool_lava",
		{pos = pos, max_hear_distance = 16, gain = 0.25})
end

core.register_abm({
	nodenames = {"default:lava_flowing"},
	neighbors = {"group:water"},
	interval = 1,
	chance = 2,
	action = function(...)
		default.cool_lava_flowing(...)
	end,
})

core.register_abm({
	nodenames = {"default:lava_source"},
	neighbors = {"group:water"},
	interval = 1,
	chance = 2,
	action = function(...)
		default.cool_lava_source(...)
	end,
})
