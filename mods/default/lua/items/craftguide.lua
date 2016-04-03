--[[
This file is from the "Crafting Guide" mod by kilbith; modified by LNJ2.
See https://github.com/minetest-mods/craftguide for details!

License of this file:
---------------------
Copyright (C) 2016 kilbith <jeanpatrick.guerrero@gmail.com>

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
--]]

local craftguide, datas, npp = {}, {}, 8*3

function craftguide:get_recipe(item)
	if item:sub(1,6) == "group:" then
		if item:sub(-4) == "wool" or item:sub(-3) == "dye" then
			item = item:sub(7)..":white"
		elseif core.registered_items["default:"..item:sub(7)] then
			item = item:gsub("group:", "default:")
		else for node, def in pairs(core.registered_items) do
			 if def.groups[item:match("[^,:]+$")] then item = node end
		     end
		end
	end
	return item
end

function craftguide:get_formspec(player_name, pagenum, recipe_num)
	local data = datas[player_name]
	local formspec = [[ size[8,7.6;]
			image[0,0;1,1;default_craft_guide.png]
			label[1,0.25;Crafting Guide]
			tablecolumns[color;text;color;text]
			tableoptions[background=#00000000;highlight=#00000000;border=false]
			button[5.4,1;0.8,0.95;prev;<]
			button[7.2,1;0.8,0.95;next;>]
			button[2.5,1.2;0.8,0.5;search;?]
			button[3.2,1.2;0.8,0.5;clear;X]
			tooltip[search;Search]
			tooltip[clear;Reset]
			table[6,1.18;1.1,0.5;pagenum;#FFFF00,]]..
			pagenum..",#FFFFFF,/ "..data.pagemax.."]"..
			"field[0.3,1.32;2.6,1;filter;;"..data.filter.."]"..
			default.gui_bg..default.gui_bg_img

	local i, s = 0, 0
	for _, name in pairs(data.items) do
		if s < (pagenum - 1) * npp then
			s = s + 1
		else if i >= npp then break end
			local X = i % 8
			local Y = ((i-X) / 8) + 2

			formspec = formspec.."item_image_button["..X..","..Y..";1,1;"..
					     name..";"..name..";]"
			i = i + 1
		end
	end

	if data.item and core.registered_items[data.item] then
		local recipes = core.get_all_craft_recipes(data.item)
		if recipe_num > #recipes then recipe_num = 1 end

		if #recipes > 1 then formspec = formspec..
			[[ button[0,7;2.6,1;alternate;Alternate]
			label[0,6.5;Recipe ]]..recipe_num.." of "..#recipes.."]"
		end

		local type = recipes[recipe_num].type
		if type == "cooking" then formspec = formspec..
			"image[3.475,5.1;1,1;" .. core.inventorycube("default_furnace_top.png", "default_furnace_front.png", "default_furnace_side.png") .. "]"
		end

		local items = recipes[recipe_num].items
		local width = recipes[recipe_num].width
		if width == 0 then width = math.min(3, #items) end
		-- Lua 5.3 removed `table.maxn`, use this alternative in case of breakage:
		-- https://github.com/kilbith/xdecor/blob/master/handlers/helpers.lua#L1
		local rows = math.ceil(table.maxn(items) / width)

		for i, v in pairs(items) do
			local X = (i-1) % width + 4.5
			local Y = math.floor((i-1) / width + (6 - math.min(2, rows))) + 1
			local label = ""
			if v:sub(1,6) == "group:" then label = "\nG" end

			formspec = formspec.."item_image_button["..X..","..Y..";1,1;"..
					     self:get_recipe(v)..";"..self:get_recipe(v)..";"..label.."]"
		end

		local output = recipes[recipe_num].output
		formspec = formspec..[[ image[3.5,6;1,1;gui_furnace_arrow_bg.png^[transformR90]
				        item_image_button[2.5,6;1,1;]]..output..";"..data.item..";]"		     
	end

	data.formspec = formspec
	core.show_formspec(player_name, "craft_guide", formspec)
end

function craftguide:get_items(player_name)
	local items_list, data = {}, datas[player_name]
	for name, def in pairs(core.registered_items) do
		if not (def.groups.not_in_creative_inventory == 1) and
				core.get_craft_recipe(name).items and
				def.description and def.description ~= "" and
				(def.name:find(data.filter, 1, true) or
					def.description:lower():find(data.filter, 1, true)) then
			items_list[#items_list+1] = name
		end
	end

	table.sort(items_list)
	data.items = items_list
	data.size = #items_list
	data.pagemax = math.ceil(data.size / npp)
end

core.register_on_player_receive_fields(function(player, formname, fields)
	if formname ~= "craft_guide" then return end
	local player_name = player:get_player_name()
	local data = datas[player_name]
	local formspec = data.formspec
	local pagenum = tonumber(formspec:match("#FFFF00,(%d+)")) or 1

	if fields.clear then
		data.filter, data.item = "", nil
		craftguide:get_items(player_name)
		craftguide:get_formspec(player_name, 1, 1)
	elseif fields.alternate then
		local recipe_num = tonumber(formspec:match("Recipe%s(%d+)")) or 1
		recipe_num = recipe_num + 1
		craftguide:get_formspec(player_name, pagenum, recipe_num)
	elseif fields.search then
		data.filter = fields.filter:lower()
		craftguide:get_items(player_name)
		craftguide:get_formspec(player_name, 1, 1)
	elseif fields.prev or fields.next then
		if fields.prev then pagenum = pagenum - 1
		else pagenum = pagenum + 1 end
		if     pagenum > data.pagemax then pagenum = 1
		elseif pagenum == 0	      then pagenum = data.pagemax end
		craftguide:get_formspec(player_name, pagenum, 1)
	else for item in pairs(fields) do
		 if core.get_craft_recipe(item).items then
			data.item = item
			craftguide:get_formspec(player_name, pagenum, 1)
		 end
	     end
	end
end)

core.register_craftitem("default:craft_guide", {
	description = "Crafting Guide",
	inventory_image = "default_craft_guide.png",
	wield_image = "default_craft_guide.png",
	stack_max = 1,
	groups = {book = 1},
	on_use = function(itemstack, user)
		local player_name = user:get_player_name()
		if not datas[player_name] then
			datas[player_name] = {}
			datas[player_name].filter = ""
			craftguide:get_items(player_name)
			craftguide:get_formspec(player_name, 1, 1)
		else
			core.show_formspec(player_name, "craft_guide", datas[player_name].formspec)
		end
	end
})
