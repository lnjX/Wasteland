local dyes = {
	{"white",      "White",      nil},
	{"grey",       "Grey",       "basecolor_grey"},
	{"black",      "Black",      "basecolor_black"},
	{"red",        "Red",        "basecolor_red"},
	{"yellow",     "Yellow",     "basecolor_yellow"},
	{"green",      "Green",      "basecolor_green"},
	{"cyan",       "Cyan",       "basecolor_cyan"},
	{"blue",       "Blue",       "basecolor_blue"},
	{"magenta",    "Magenta",    "basecolor_magenta"},
	{"orange",     "Orange",     "excolor_orange"},
	{"violet",     "Violet",     "excolor_violet"},
	{"brown",      "Brown",      "unicolor_dark_orange"},
	{"pink",       "Pink",       "unicolor_light_red"},
	{"dark_grey",  "Dark Grey",  "unicolor_darkgrey"},
	{"dark_green", "Dark Green", "unicolor_dark_green"},
}

-- Register wool blocks
for _, row in ipairs(dyes) do
	local name = row[1]
	local desc = row[2]
	local craft_color_group = row[3]
	
	-- Node Definition
	default.register_node("default:wool_" .. name, {
		register = {carpet = true},
		description = desc .. " Wool",
		tiles = {"wool_" .. name .. ".png"},
		is_ground_content = false,
		groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3, flammable = 3, wool = 1},
		sounds = default.node_sound_defaults(),
		alias = "wool:" .. name, -- aliases for old wool mod
		carpet = {
			name = "default:carpet_" .. name,
			alias = "wool:carpet_" .. name, -- aliases for old wool mod
		}
	})
	
	if craft_color_group then
		-- Crafting from dye and white wool
		core.register_craft({
			type = "shapeless",
			output = "default:wool_" .. name,
			recipe = {"group:dye," .. craft_color_group, "group:wool"},
		})
	end
	
	-- Carpet crafting from wool blocks
	core.register_craft({
		output = "default:carpet_" .. name .. " 4",
		recipe = {
			{"default:wool_" .. name, "default:wool_" .. name},
		},
	})
end
