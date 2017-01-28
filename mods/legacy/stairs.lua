-- mods/legacy/stairs.lua
-- ======================
-- See README.txt for licensing and other information.

stairs = {}

-- stairs
function stairs.register_stair(subname, recipeitem, groups, images, description, sounds)
	default.register_stair(":stairs:stair_" .. subname, {
		description = description,
		tiles = images,
		material = recipeitem,
		groups = groups,
		sounds = sounds
	})
end

-- slabs
function stairs.register_slab(subname, recipeitem, groups, images, description, sounds)
	default.register_slab(":stairs:slab_" .. subname, {
		description = description,
		tiles = images,
		material = recipeitem,
		groups = groups,
		sounds = sounds
	})
end

-- stairs and slabs
function stairs.register_stair_and_slab(subname, recipeitem, groups, images, desc_stair, desc_slab, sounds)
	stairs.register_stair(subname, recipeitem, groups, images, desc_stair, sounds)
	stairs.register_slab(subname, recipeitem, groups, images, desc_slab, sounds)
end


-- aliases
core.register_alias("stairs:stair_wood", "default:stair_wood")
core.register_alias("stairs:slab_wood", "default:slab_wood")
core.register_alias("stairs:stair_junglewood", "default:stair_junglewood")
core.register_alias("stairs:slab_junglewood", "default:slab_pine_wood")
core.register_alias("stairs:stair_pine_wood", "default:stair_pine_wood")
core.register_alias("stairs:slab_pine_wood", "default:slab_pine_wood")
core.register_alias("stairs:stair_acacia_wood", "default:stair_acacia_wood")
core.register_alias("stairs:slab_acacia_wood", "default:slab_acacia_wood")
core.register_alias("stairs:stair_birch_wood", "default:stair_birch_wood")
core.register_alias("stairs:slab_birch_wood", "default:slab_birch_wood")
core.register_alias("stairs:stair_brick", "default:stair_brick")
core.register_alias("stairs:slab_brick", "default:slab_brick")
core.register_alias("stairs:stair_stonebrick", "default:stair_stonebrick")
core.register_alias("stairs:slab_stonebrick", "default:slab_stonebrick")
core.register_alias("stairs:stair_desert_stonebrick", "default:stair_desert_stonebrick")
core.register_alias("stairs:slab_desert_stonebrick", "default:slab_desert_stonebrick")
core.register_alias("stairs:stair_sandstonebrick", "default:stair_sandstonebrick")
core.register_alias("stairs:slab_sandstonebrick", "default:slab_sandstonebrick")
core.register_alias("stairs:stair_obsidianbrick", "default:stair_obsidianbrick")
core.register_alias("stairs:slab_obsidianbrick", "default:slab_obsidianbrick")
core.register_alias("stairs:stair_cobble", "default:stair_cobble")
core.register_alias("stairs:slab_cobble", "default:slab_cobble")
core.register_alias("stairs:stair_desert_cobble", "default:stair_desert_cobble")
core.register_alias("stairs:slab_desert_cobble", "default:slab_desert_cobble")
core.register_alias("stairs:stair_stone", "default:stair_stone")
core.register_alias("stairs:slab_stone", "default:slab_stone")
core.register_alias("stairs:stair_desert_stone", "default:stair_desert_stone")
core.register_alias("stairs:slab_desert_stone", "default:slab_desert_stone")
core.register_alias("stairs:stair_sandstone", "default:stair_sandstone")
core.register_alias("stairs:slab_sandstone", "default:slab_sandstone")
core.register_alias("stairs:stair_obsidian", "default:stair_obsidian")
core.register_alias("stairs:slab_obsidian", "default:slab_obsidian")

core.register_alias("stairs:stair_pinewood", "default:stair_pine_wood")
core.register_alias("stairs:slab_pinewood", "default:slab_pine_wood")


-- old upside_down version
legacy.register_stair_replace("stairs:stair_woodupside_down", "default:stair_wood")
legacy.register_stair_replace("stairs:slab_woodupside_down", "default:slab_wood")
legacy.register_stair_replace("stairs:stair_junglewoodupside_down", "default:stair_junglewood")
legacy.register_stair_replace("stairs:slab_junglewoodupside_down", "default:slab_pine_wood")
legacy.register_stair_replace("stairs:stair_brickupside_down", "default:stair_brick")
legacy.register_stair_replace("stairs:slab_brickupside_down", "default:slab_brick")
legacy.register_stair_replace("stairs:stair_stonebrickupside_down", "default:stair_stonebrick")
legacy.register_stair_replace("stairs:slab_stonebrickupside_down", "default:slab_stonebrick")
legacy.register_stair_replace("stairs:stair_cobbleupside_down", "default:stair_cobble")
legacy.register_stair_replace("stairs:slab_cobbleupside_down", "default:slab_cobble")
legacy.register_stair_replace("stairs:stair_stoneupside_down", "default:stair_stone")
legacy.register_stair_replace("stairs:slab_stoneupside_down", "default:slab_stone")
legacy.register_stair_replace("stairs:stair_desert_stoneupside_down", "default:stair_desert_stone")
legacy.register_stair_replace("stairs:slab_desert_stoneupside_down", "default:slab_desert_stone")
