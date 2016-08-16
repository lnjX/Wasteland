-- mods/hunger/init.lua
-- ====================
-- See README.txt for licensing and other information.

hunger = {}
hunger.players = {}

HUNGER_TICK = 600		-- time in seconds after that 1 hunger point is taken
HUNGER_HEALTH_TICK = 20		-- time in seconds after player gets healed/damaged
HUNGER_MOVE_TICK = 0.5		-- time in seconds after the movement is checked

HUNGER_EXHAUST_DIG = 3		-- exhaustion increased this value after digged node
HUNGER_EXHAUST_PLACE = 1	-- exhaustion increased this value after placed
HUNGER_EXHAUST_MOVE = 1.5	-- exhaustion increased this value if player movement detected
HUNGER_EXHAUST_LVL = 160	-- at what exhaustion player saturation gets lowered

HUNGER_HEAL = 1			-- number of HP player gets healed after HUNGER_HEALTH_TICK
HUNGER_HEAL_LVL = 17		-- lower level of saturation needed to get healed
HUNGER_STARVE = 1		-- number of HP player gets damaged by hunger after HUNGER_HEALTH_TICK
HUNGER_STARVE_LVL = 3		-- level of staturation that causes starving

HUNGER_MAX = 30			-- maximum level of saturation


local modpath = core.get_modpath("hunger")
dofile(modpath .. "/functions.lua")


-- Callbacks
if core.setting_getbool("enable_damage") then
	core.register_on_joinplayer(function(player)
		local inv = player:get_inventory()
		inv:set_size("hunger", 1)

		local name = player:get_player_name()
		hunger.players[name] = {}
		hunger.players[name].lvl = hunger.read(player)
		hunger.players[name].exhaus = 0
		local lvl = hunger.players[name].lvl
		if lvl > 20 then
			lvl = 20
		end
		core.after(0.8, function()
			hud.swap_statbar(player, "hunger", "air")
			hud.change_item(player, "hunger", {number = lvl, max = 20})
		end)
	end)

	-- for exhaustion
	core.register_on_placenode(hunger.handle_node_actions)
	core.register_on_dignode(hunger.handle_node_actions)
	core.register_on_respawnplayer(function(player)
		hunger.update_hunger(player, 20)
	end)
end
