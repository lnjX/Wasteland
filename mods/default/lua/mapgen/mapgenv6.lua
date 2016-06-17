-- mods/default/lua/mapgenv6.lua
-- =============================
-- See README.txt for licensing and other information.

--
-- Register decorations
--

-- y?
core.clear_registered_decorations()

function make_dead_tree(pos, size)
	if size == nil then
		size = math.random(3,6)
	end
	for y=0,size-1 do
		local p = {x=pos.x, y=pos.y+y, z=pos.z}
		local nn = core.get_node(p).name
		if core.registered_nodes[nn] and
		   core.registered_nodes[nn].buildable_to then
			core.after(0.2,function()
			  core.swap_node(p, {name="default:dead_tree"})
			end)
		else
			return
		end
	end
end

local dirt_snow = core.get_content_id("default:dirt_with_snow")
local dirt_dry = core.get_content_id("default:dry_dirt")
local leaves = core.get_content_id("default:leaves")
local snow = core.get_content_id("default:snow")
local ms = core.get_content_id("default:mineralsand")
local sand = core.get_content_id("default:sand")
local air = core.get_content_id("air")

local function make_snow(min, max, data, va, rnd)
	local y1 = min.y
	local x1 = min.x
	local z1 = min.z
	local x2 = max.x
	local z2 = max.z
	local y_max = SNOW_START + rnd
	if y1 == 48 then
		y_max = y1
	end
	for yi = max.y, y_max, -1 do
	 	for xi = x1, x2 do
	  	for zi = z1, z2 do
			local pi = va:index(xi, yi, zi)
			if data[pi] == dirt_dry then
				data[pi] = dirt_snow
			end
			if data[pi] == dirt_snow then
				local opi = va:index(xi, yi + 1, zi)
				if data[opi] == air then
					data[pi] = snow
				end
			end
	   	end
	  	end
	end
	return data
end

local function make_minerals(min, max, data, va)
	local x1 = min.x
	local z1 = min.z
	local x2 = max.x
	local z2 = max.z
	for yi = min.y, MINERAL_MAX do
	 	for xi = x1, x2 do
	  	for zi = z1, z2 do
			local pi = va:index(xi, yi, zi)
			local pi2 = va:index(xi, yi - 1, zi)
			if data[pi] == air and data[pi2] == sand then
				data[pi] = ms
			end
	   	end
	  	end
	end
	return data, false
end
core.register_on_generated(function(minp, maxp, seed)
	local by = minp.y
	if not (by == -32 or by == 48) then
		return
	end

	local pr = PseudoRandom(seed+1)
	if by == -32 then
		-- dead trees
		local perlin1 = core.get_perlin(230, 3, 0.6, 100)
		-- Assume X and Z lengths are equal
		local divlen = 16
		local divs = (maxp.x - minp.x)/divlen + 1;
		for divx = 0, divs - 1 do
		for divz = 0, divs - 1 do
			local x0 = minp.x + math.floor((divx+0)*divlen)
			local z0 = minp.z + math.floor((divz+0)*divlen)
			local x1 = minp.x + math.floor((divx+1)*divlen)
			local z1 = minp.z + math.floor((divz+1)*divlen)
			-- Determine dead tree amount from perlin noise
			local amount = math.floor(perlin1:get2d({x = x0, y = z0}) * 2.8 - 3)
			-- Find random positions for dead trees
			for i = 0,amount do
				local x = pr:next(x0, x1)
				local z = pr:next(z0, z1)
				-- Find ground level (0...15)
				local ground_y = nil
				local ground_n = nil
				for y = 20, 0, -1 do
					ground_n = core.get_node_or_nil({x = x, y = y, z = z})
					if ground_n and ground_n.name== "default:dry_dirt" then
						ground_y = y
						break
					end
				end
				-- If dry dirt make dead tree
				if ground_y and ground_n then
					make_dead_tree({x = x, y = ground_y + 1, z = z})
				end
			end
		end
		end


		-- Generate dry grass
		local perlin1 = core.get_perlin(480, 3, 0.6, 100)
		-- Assume X and Z lengths are equal
		local divlen = 16
		local divs = (maxp.x-minp.x)/divlen+1;
		for divx=0,divs-1 do
		for divz=0,divs-1 do
			local x0 = minp.x + math.floor((divx+0)*divlen)
			local z0 = minp.z + math.floor((divz+0)*divlen)
			local x1 = minp.x + math.floor((divx+1)*divlen)
			local z1 = minp.z + math.floor((divz+1)*divlen)
			-- Determine grass amount from perlin noise
			local grass_amount = math.floor(perlin1:get2d({x=x0, y=z0}) ^ 3 * 4)
			-- Find random positions for grass based on this random
			local pr = PseudoRandom(seed+1)
			for i=0,grass_amount do
				local x = pr:next(x0, x1)
				local z = pr:next(z0, z1)
				-- Find ground level (0...15)
				local ground_y = nil
				for y=20,0,-1 do
					if core.get_node({x=x,y=y,z=z}).name ~= "air" then
						ground_y = y
						break
					end
				end

				if ground_y then
					local p = {x=x,y=ground_y+1,z=z}
					local nn = core.get_node(p).name
					-- Check if the node can be replaced
					if core.registered_nodes[nn] and
						core.registered_nodes[nn].buildable_to then
						nn = core.get_node({x=x,y=ground_y,z=z}).name
						-- If desert sand, add dry shrub
						if nn == "default:dry_dirt" then
							core.swap_node(p,{name="default:dry_shrub"})
						end
					end
				end

			end
		end
		end


		--data =
	end

	-- snowcaps and mineral sand
	local snow_height_rnd = pr:next(0,3)

	-- delay mapgen to reduce conflicts with mud regeneration
	if by == 48 then
		local timeout = 0
		while timeout < 5 do
			timeout = timeout + 1
		end
	end

	local vm, emin, emax = core.get_mapgen_object("voxelmanip")
	local data = vm:get_data()
	local va = VoxelArea:new{MinEdge = emin, MaxEdge = emax}

	if by == -32 then
		-- Generate mineral sand
		local wait = true
		data, wait = make_minerals(minp, maxp, data, va)

		while wait do
			--wait for first manip to finish
		end
		data = make_snow(minp, maxp, data, va, snow_height_rnd)
	else
		data = make_snow(minp, maxp, data, va, snow_height_rnd)
	end


	-- write vmanip data
	vm:set_data(data)
	vm:calc_lighting()
	vm:write_to_map(data)
end)

-- Dry shrubs
core.register_decoration({
	deco_type = "simple",
	place_on = {"default:desert_sand", "default:dirt_with_snow"},
	sidelen = 16,
	noise_params = {
		offset = 0,
		scale = 0.035,
		spread = {x = 100, y = 100, z = 100},
		seed = 329,
		octaves = 3,
		persist = 0.6
	},
	y_min = 1,
	y_max = 30,
	decoration = "default:dry_shrub",
})

core.register_on_generated(default.generate_nyancats)
core.register_on_generated(default.generate_ruins)
