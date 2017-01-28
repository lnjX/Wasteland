--[[
License of this file:
---------------------
Copyright (C) 2012 xyz
Copyright (C) 2014 sfan5
Copyright (C) 2016 LNJ <lnj.git@gmail.com>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
--]]

default.homes_file = core.get_worldpath() .. "/homes"
default.homes_pos = {}

function default.homes_load()
	local input = io.open(default.homes_file, "r")
	if input then
		repeat
			local x = input:read("*n")
			if x == nil then
				break
			end
			local y = input:read("*n")
			local z = input:read("*n")
			local name = input:read("*l")
			default.homes_pos[name:sub(2)] = {x = x, y = y, z = z}
		until input:read(0) == nil
		io.close(input)
	else
		default.homes_pos = {}
	end
end

default.homes_load()

core.register_privilege("home", "Can use /sethome and /home")

core.register_chatcommand("home", {
	description = "Teleport you to your home point",
	privs = {home = true},
	func = function(name)
		local player = core.get_player_by_name(name)
		if player == nil then
			return false
		end
        
		if default.homes_pos[player:get_player_name()] then
			player:setpos(default.homes_pos[player:get_player_name()])
			core.chat_send_player(name, "Teleported to home!")
		else
			core.chat_send_player(name, "Set a home using /sethome")
		end
	end,
})

core.register_chatcommand("sethome", {
	description = "Set your home point",
	privs = {home = true},
	func = function(name)
		local player = core.get_player_by_name(name)
		local pos = player:getpos()
		
		default.homes_pos[player:get_player_name()] = pos
		
		core.chat_send_player(name, "Home set!")
		
		local changed = true
		if changed then
			local output = io.open(default.homes_file, "w")
			for i, v in pairs(default.homes_pos) do
				output:write(v.x .. " " .. v.y .. " " .. v.z .. " " .. i .. "\n")
			end
			io.close(output)
			changed = false
		end
	end,
})
