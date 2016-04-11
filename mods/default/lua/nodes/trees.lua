default.register_tree(nil, {
	log = {
		name = "default:tree",
		description = "Log",
		tiles = {"default_tree_top.png", "default_tree_top.png", "default_tree.png"}
	},
	leaves = {
		name = "default:leaves",
		description = "Leaves",
		texture = "default_leaves.png",
		texture_special = "default_leaves_simple.png",
	},
	sapling = {
		name = "default:sapling",
		description = "Sapling",
		texture = "default_sapling.png",
	},
	planks = {
		name = "default:wood",
		description = "Wooden Planks",
		description_prefix = "Wooden",
		texture = "default_wood.png"
	},
})

default.register_tree(nil, {
	description = "Jungle",
	log = {
		name = "default:jungletree",
		tiles = {"default_jungletree_top.png", "default_jungletree_top.png", "default_jungletree.png"}
	},
	leaves = {
		name = "default:jungleleaves",
		texture = "default_jungleleaves.png",
		texture_special = "default_jungleleaves_simple.png",
		sapling_rarity = 24
	},
	sapling = {
		name = "default:junglesapling",
		description = "Jungle Sapling",
		texture = "default_junglesapling.png",
		growtime = 270 -- 4.5 min -> in average 5.4 min
	},
	planks = {
		name = "default:junglewood",
		description = "Junglewood Planks",
		description_prefix = "Junglewood",
		texture = "default_junglewood.png"
	},
})

default.register_tree("default:pine", {
	description = "Pine",
	texture_prefix = "default_pine",
	leaves = {
		name = "default:pine_needles",
		description = "Pine Needles",
		texture = "default_pine_needles.png",
		texture_special = "default_pine_needles_simple.png",
		sapling_rarity = 24
	},
})

default.register_tree("default:acacia", {
	description = "Acacia",
	texture_prefix = "default_acacia",
	sapling = {
		growtime = 420 -- 7 min -> in average 8.4 min
	},
})

default.register_tree("default:birch", {
	description = "Birch",
	texture_prefix = "default_birch",
	sapling = {
		growtime = 420 -- 7 min -> in average 8.4 min
	},
})
