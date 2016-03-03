local modpath = minetest.get_modpath("default") .. "/nodes/"

dofile(modpath .. "sounds.lua")

-- full/natural/mapgen
dofile(modpath .. "ores.lua")
dofile(modpath .. "leaves.lua")
dofile(modpath .. "logs.lua")

dofile(modpath .. "dirt.lua")
dofile(modpath .. "sand.lua")
dofile(modpath .. "gravel.lua")
dofile(modpath .. "stone.lua")
dofile(modpath .. "cobble.lua")

dofile(modpath .. "ice.lua")
dofile(modpath .. "snow.lua")


-- Plants
dofile(modpath .. "grass.lua")
dofile(modpath .. "papyrus.lua")
dofile(modpath .. "saplings.lua")

dofile(modpath .. "cactus.lua")


-- liquids
dofile(modpath .. "water.lua")
dofile(modpath .. "lava.lua")


-- crafted
dofile(modpath .. "glass.lua")
dofile(modpath .. "planks.lua")

dofile(modpath .. "bricks.lua")


-- light
dofile(modpath .. "torch.lua")
dofile(modpath .. "lamps.lua")

-- blocks with an inventory
dofile(modpath .. "chests.lua")
dofile(modpath .. "furnace.lua")
dofile(modpath .. "bookshelf.lua")

-- nodes with special functions
dofile(modpath .. "signs.lua")
dofile(modpath .. "fences.lua")
dofile(modpath .. "latter.lua")
dofile(modpath .. "rails.lua")
dofile(modpath .. "itemframes.lua")
dofile(modpath .. "tables.lua")

-- special
dofile(modpath .. "food.lua")
dofile(modpath .. "nyancat.lua")

dofile(modpath .. "unused.lua")
