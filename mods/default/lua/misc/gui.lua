-- mods/default/lua/gui.lua

-- Default formspec appearance
default.gui_bg = "bgcolor[#080808BB;true]"
default.gui_bg_img = "background[5,5;1,1;gui_formbg.png;true]"
default.gui_slots = "listcolors[#00000069;#5A5A5A;#141318;#30434C;#FFF]"

function default.get_hotbar_bg(x, y)
	local out = ""
	for i = 0, 7 do
		out = out .."image[" .. x + i .. "," .. y .. ";1,1;gui_hb_bg.png]"
	end
	return out
end

-- Survival inventory
default.gui_survival_form = "size[8,9.5]" ..
	default.gui_bg ..
	default.gui_bg_img ..
	default.gui_slots ..
	-- crafting icon
	"image[1.7,0;1,1;default_crafting_icon.png]" ..
	"label[2.7,0.25;Crafting]" ..
	-- crafting
	"list[current_player;craft;1.75,1;3,3;]" ..
	"image[4.75,2;1,1;gui_furnace_arrow_bg.png^[transformR270]" ..
	"list[current_player;craftpreview;5.75,2;1,1;]" ..
	-- Inventory icon
	"image[0,4.2;1,1;default_inventory_icon.png]" ..
	-- label (Inventory)
	"label[1,4.45;Inventory]" ..
	-- Main inventory
	"list[current_player;main;0,5.25;8,1;]" ..
	"list[current_player;main;0,6.5;8,3;8]" ..
	"listring[current_player;main]" ..
	"listring[current_player;craft]" ..
	default.get_hotbar_bg(0, 4.25)


-- Creative inventorys
--default.gui_creative_form = 

default.gui_creative_crafting_form = [[
	size[8,8.6]
	list[current_player;main;0,4.7;8,1;]
	list[current_player;main;0,5.85;8,3;8]
	list[current_player;craft;2,0.75;3,3;]
	list[current_player;craftpreview;6,1.75;1,1;]
	
	list[detached:creative_trash;main;0,2.75;1,1;]
	image[0.06,2.85;0.8,0.8;default_trash_icon.png]
	image[5,1.75;1,1;gui_furnace_arrow_bg.png^[transformR270]
	tabheader[0,0;creative_tabs;Crafting,All,Nodes,Tools,Items;1;true;false]
	listring[current_player;main]
	listring[current_player;craft]
	]] ..
	default.get_hotbar_bg(0,4.7)..
	default.gui_bg .. default.gui_bg_img .. default.gui_slots

