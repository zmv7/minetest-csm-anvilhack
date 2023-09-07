local function is_anvil(pos)
	local node = minetest.get_node_or_nil(pos)
	if node and node.name == "anvil:anvil" then
		return true
	end
end

local function anvilhack_fs(pos)
	local posstr = minetest.pos_to_string(pos):gsub("[%(%)]","")
	if posstr then
		minetest.show_formspec("anvilhack","size[8,5]list[current_player;main;0,1;8,4]list[nodemeta:"..minetest.formspec_escape(posstr)..";input;3.5,0;1,1]listring[]")
	end
end

minetest.register_chatcommand("anvilhack", {
  description = "Look at anvil and use this command",
  func = function(param)
	local csmr = minetest.get_csm_restrictions()
	if csmr and not csmr.lookup_nodes then
		local pos = vector.round(minetest.localplayer:get_pos())
		if is_anvil(pos) then
			anvilhack_fs(pos)
			return
		else
			return false, "The server restricts getting nodes from the distance. Stay directly on the anvil and try anvilhack again"
		end
	end
	local raybegin = vector.add(minetest.camera:get_pos(),{x=0, y=0, z=0})
	local rayend = vector.add(raybegin, vector.multiply(minetest.camera:get_look_dir(), 6))
	local ray = Raycast(raybegin, rayend, false, false)
	for thing in ray do
		if thing.type == "node" and thing.under then
			if is_anvil(thing.under) then
				anvilhack_fs(thing.under)
				return
			end
		end
	end
	return false, "No anvils found"
end})
