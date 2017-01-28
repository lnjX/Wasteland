-- mods/default/lua/nodes/workbench.lua
-- ====================================
-- See README.txt for licensing and other information.

default.workbench_formspec =
	"size[8,9]" ..
	default.gui_bg ..
	default.gui_bg_img ..
	default.gui_slots ..
	-- Inventory icon
	"image[0,3.75;1,1;default_inventory_icon.png]" ..
	-- label (Inventory)
	"label[1,4;Inventory]" ..
	-- main inventory
	"list[current_player;main;0,4.85;8,1;]" ..
	"list[current_player;main;0,6.08;8,3;8]" ..
	-- crafting field
	"list[current_player;craft;1.75,1;3,3;]" ..
	-- crafting preview / output
	"list[current_player;craftpreview;5.75,2;1,1;]" ..
	"image[4.75,2;1,1;gui_furnace_arrow_bg.png^[transformR270]" ..
	-- label (Workbench)
	"label[2.75,0.25;Workbench]" ..
	-- Workbench image
	"image[1.75,0;1,1;" .. core.inventorycube("default_workbench_top.png", "default_workbench_front.png", "default_workbench_side.png") .. "]"



function default.open_workbench(player)
	player:get_inventory():set_size("craft", 3*3)
	player:get_inventory():set_size("main", 8*4)

	core.show_formspec(player:get_player_name(), "main", default.workbench_formspec)
end

default.register_node("default:workbench", {
	description = "Workbench",
	tiles = {"default_workbench_top.png", "default_wood.png", "default_workbench_side.png",
		"default_workbench_side.png", "default_workbench_front.png", "default_workbench_front.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	on_rightclick = function(pos, node, clicker)
		default.open_workbench(clicker)
	end
})

-- Crafting
core.register_craft({
	output = "default:workbench",
	recipe = {
		{"group:wood", "group:wood"},
		{"group:wood", "group:wood"}
	}
})
