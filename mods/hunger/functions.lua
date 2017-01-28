-- mods/hunger/functions.lua
-- =========================
-- See README.txt for licensing and other information.

-- read/write
function hunger.read(player)
	local inv = player:get_inventory()
	if not inv then
		return nil
	end
	local hgp = inv:get_stack("hunger", 1):get_count()
	if hgp == 0 then
		hgp = 21
		inv:set_stack("hunger", 1, ItemStack({name = ":", count = hgp}))
	else
		hgp = hgp
	end
	if tonumber(hgp) > HUNGER_MAX + 1 then
		hgp = HUNGER_MAX + 1
	end
	return hgp - 1
end

function hunger.save(player)
	local inv = player:get_inventory()
	local name = player:get_player_name()
	local value = hunger.players[name].lvl
	if not inv or not value then
		return nil
	end
	if value > HUNGER_MAX then
		value = HUNGER_MAX
	end
	if value < 0 then
		value = 0
	end
	inv:set_stack("hunger", 1, ItemStack({name = ":", count = value + 1}))
	return true
end

function hunger.update_hunger(player, new_lvl)
	local name = player:get_player_name() or nil
	if not name then
		return false
	end
	if core.setting_getbool("enable_damage") == false then
		hunger.players[name] = 20
		return
	end
	local lvl = hunger.players[name].lvl
	if new_lvl then
		 lvl = new_lvl
	end
	if lvl > HUNGER_MAX then
		lvl = HUNGER_MAX
	end
	hunger.players[name].lvl = lvl
	if lvl > 20 then
		lvl = 20
	end
	hud.change_item(player, "hunger", {number = lvl})
	hunger.save(player)
end
local update_hunger = hunger.update_hunger

-- player-action based hunger changes
function hunger.handle_node_actions(pos, oldnode, player, ext)
	if not player or not player:is_player() then
		return
	end
	local name = player:get_player_name()
	if not name or not hunger.players[name] then
		return
	end

	local exhaus = hunger.players[name].exhaus
	if not exhaus then
		hunger.players[name].exhaus = 0
		--return
	end

	local new = HUNGER_EXHAUST_PLACE

	-- placenode event
	if not ext then
		new = HUNGER_EXHAUST_DIG
	end

	-- assume its send by action_timer(globalstep)
	if not pos and not oldnode then
		new = HUNGER_EXHAUST_MOVE
	end

	exhaus = exhaus + new

	if exhaus > HUNGER_EXHAUST_LVL then
		exhaus = 0
		local h = tonumber(hunger.players[name].lvl)
		if h > 0 then
			update_hunger(player, h - 1)
		end
	end

	hunger.players[name].exhaus = exhaus
end


-- Time based hunger functions
local hunger_timer = 0
local health_timer = 0
local action_timer = 0

local function hunger_globaltimer(dtime)
	hunger_timer = hunger_timer + dtime
	health_timer = health_timer + dtime
	action_timer = action_timer + dtime

	if action_timer > HUNGER_MOVE_TICK then
		for _,player in ipairs(core.get_connected_players()) do
			local controls = player:get_player_control()
			-- Determine if the player is walking
			if controls.up or controls.down or controls.left or controls.right then
				hunger.handle_node_actions(nil, nil, player)
			end
		end
		action_timer = 0
	end

	-- lower saturation by 1 point after <HUNGER_TICK> second(s)
	if hunger_timer > HUNGER_TICK then
		for _,player in ipairs(core.get_connected_players()) do
			local name = player:get_player_name()
			local tab = hunger.players[name]
			if tab then
				local hunger = tab.lvl
				if hunger > 0 then
					update_hunger(player, hunger - 1)
				end
			end
		end
		hunger_timer = 0
	end

	-- heal or damage player, depending on saturation
	if health_timer > HUNGER_HEALTH_TICK then
		for _,player in ipairs(core.get_connected_players()) do
			local name = player:get_player_name()
			local tab = hunger.players[name]
			if tab then
				local air = player:get_breath() or 0
				local hp = player:get_hp()

				-- heal player by 1 hp if not dead and saturation is > 15 (of 30) player is not drowning
				if tonumber(tab.lvl) > HUNGER_HEAL_LVL and hp > 0 and air > 0 then
					player:set_hp(hp + HUNGER_HEAL)
				end

				-- or damage player by 1 hp if saturation is < 2 (of 30)
				if tonumber(tab.lvl) < HUNGER_STARVE_LVL then
					player:set_hp(hp - HUNGER_STARVE)
				end
			end
		end

		health_timer = 0
	end
end

if core.setting_getbool("enable_damage") then
	core.register_globalstep(hunger_globaltimer)
end


-- food functions
local food = hunger.food

function hunger.register_food(name, hunger_change, replace_with_item, poisen, heal, sound)
	core.log("deprecated", "'hunger.register_food' is deprecated. Don't registering food.")
end

-- Poison player
local function poisenp(tick, time, time_left, player)
	time_left = time_left + tick
	if time_left < time then
		core.after(tick, poisenp, tick, time, time_left, player)
	else
		hud.change_item(player, "hunger", {text = "hud_hunger_fg.png"})
	end
	local hp = player:get_hp() -1 or 0
	if hp > 0 then
		player:set_hp(hp)
	end
end


--
-- Overwrite the original eating function
--

-- wrapper for core.item_eat (this way we make sure other mods can't break this one)
local org_eat = core.do_item_eat
core.do_item_eat = function(hp_change, replace_with_item, itemstack, user, pointed_thing)
	-- the real eating funtion
	new_itemstack = hunger.eat_item(hp_change, replace_with_item, itemstack, user, pointed_thing)

	-- call all 'on_item_eat'-functions
	for _, callback in pairs(core.registered_on_item_eats) do
		local result = callback(hp_change, replace_with_item, itemstack, user, pointed_thing, itemstack)
		if result then
			return result
		end
	end

	-- return the changed item stack
	return new_itemstack
end


function hunger.eat_item(hp_change, replace_with_item, itemstack, user, pointed_thing)
	if not user then return itemstack end

	local name = user:get_player_name()
	if not hunger.players[name] then
		return itemstack
	end

	local sat = tonumber(hunger.players[name].lvl or 0)
	local hp = user:get_hp()
	local itemdef = core.registered_items[itemstack:get_name()]

	-- Saturation
	local hunger_change

	hunger_change = itemdef.groups.on_eat_saturation or hp_change or 1


	if sat < HUNGER_MAX and hunger_change then
		sat = sat + hunger_change
		hunger.update_hunger(user, sat)
	end


	-- Healing
	local heal = itemdef.groups.on_eat_heal or 0
	if hp < 20 and heal ~= 0 then
		hp = hp + heal
		if hp > 20 then
			hp = 20
		end
		user:set_hp(hp)
	end

	-- Poison
	local poisen = itemdef.groups.on_eat_poisen or 0
	if poisen ~= 0 then
		hud.change_item(user, "hunger", {text = "hunger_statbar_poisen.png"})
		poisenp(1.0, poisen, 0, user)
	end

	-- eating sound
	local soundspec
	if not itemdef.sounds or not itemdef.sounds.eat then
		soundspec = {name = "default_eat", gain = 0.7}
	else
		soundspec = itemdef.sounds.eat
	end
	core.sound_play(soundspec, {pos = user:getpos(), max_hear_distance = 8})

	-- remove the item
	itemstack:take_item()

	if replace_with_item then
		local inv = user:get_inventory()
		if inv:room_for_item("main", {name = replace_with_item}) then
			inv:add_item("main", replace_with_item)
		else
			local pos = user:getpos()
			pos.y = math.floor(pos.y + 0.5)
			core.add_item(pos, replace_with_item)
		end
	end

	return itemstack
end
