tool
extends TileSet

const DIRT = 0
const GRASS = 1
const STONE = 2
const SNOW = 3
const DIRT_STONE_BLEND = 21
const AIR = 22

var binds = {
	GRASS : [DIRT, SNOW, STONE, DIRT_STONE_BLEND, AIR],
	DIRT : [GRASS, SNOW, DIRT_STONE_BLEND, AIR],
	SNOW : [GRASS, DIRT, STONE, AIR],
	STONE : [DIRT, SNOW, GRASS, DIRT_STONE_BLEND, AIR],
	DIRT_STONE_BLEND : [DIRT, GRASS, AIR]
}

func _is_tile_bound(drawn_id, neighbor_id):
	if drawn_id in binds:
		return neighbor_id in binds[drawn_id]
	return false
