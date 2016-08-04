--[[
mods/default/lua/environment/torch_wield_light.lua
==================================================
The code in this file is from sofar's torches mod (licensed under LGPLv2.1+).
See https://github.com/minetest-mods/torches for details.

Copyright (C) 2016 sofar <sofar@foo-projects.org>

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
-- Torch wield light
--

local torchlight_update_interval = core.setting_get("torches_wieldlight_interval") or 0.25

-- state tables
local torchlight = {}
local playerlist = {}

local function wields_torch(player)
	if not player then
		return false
	end
	local item = player:get_wielded_item()
	if not item then
		return false
	end
	return item:get_name() == "default:torch"
end

local function wielded_torch(name)
	if not torchlight[name] then
		return false
	end
	return true
end

local function is_torchlight(pos)
	local node = core.get_node(pos)
	return node.name == "default:torchlight"
end

local function remove_torchlight(pos)
	if is_torchlight(pos) then
		core.swap_node(pos, {name = "air"})
	end
end

local function place_torchlight(pos)
	local name = core.get_node(pos).name
	if name == "default:torchlight" then
		return true
	end
	if (core.get_node_light(pos) or 0) > 11 then
		-- no reason to place torch here, so save a bunch
		-- of node updates this way
		return false
	end
	if name == "air" then
		core.swap_node(pos, {name = "default:torchlight"})
		return true
	end
	return false
end

local function get_torchpos(player)
	return vector.add({x = 0, y = 1, z = 0}, vector.round(player:getpos()))
end

core.register_on_joinplayer(function(player)
	local name = player:get_player_name()
	playerlist[name] = true
end)

core.register_on_leaveplayer(function(player)
	local name = player:get_player_name()
	-- don't look at wielded() here, it's likely invalid
	if torchlight[name] then
		remove_torchlight(torchlight[name])
		torchlight[name] = nil
	end
	playerlist[name] = nil
end)

core.register_on_shutdown(function()
	for i, _ in pairs(torchlight) do
		remove_torchlight(torchlight[i])
	end
end)

local function update_torchlight(dtime)
	for name, _ in pairs(playerlist) do
		local player = core.get_player_by_name(name)
		local wielded = wielded_torch(name)
		local wields = wields_torch(player)

		if not wielded and wields then
			local torchpos = get_torchpos(player)
			if place_torchlight(torchpos) then
				torchlight[name] = vector.new(torchpos)
			end
		elseif wielded and not wields then
			remove_torchlight(torchlight[name])
			torchlight[name] = nil
		elseif wielded and wields then
			local torchpos = get_torchpos(player)
			if not vector.equals(torchpos, torchlight[name]) or
					not is_torchlight(torchpos) then
				if place_torchlight(torchpos) then
					remove_torchlight(torchlight[name])
					torchlight[name] = vector.new(torchpos)
				elseif vector.distance(torchlight[name], torchpos) > 2 then
					-- player went into some node
					remove_torchlight(torchlight[name])
					torchlight[name] = nil
				end
			end
		end
	end
	core.after(torchlight_update_interval, update_torchlight)
end

core.after(torchlight_update_interval, update_torchlight)
