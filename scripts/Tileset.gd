tool
extends TileSet

const DIRT = 0
const GRASS = 1
const STONE = 2
const SNOW = 3
const DIRT_STONE_BLEND = 21

var binds = {
	GRASS : [DIRT, SNOW, STONE, DIRT_STONE_BLEND],
	DIRT : [GRASS, SNOW, DIRT_STONE_BLEND],
	SNOW : [GRASS, DIRT, STONE],
	STONE : [DIRT, SNOW, GRASS, DIRT_STONE_BLEND],
	DIRT_STONE_BLEND : [DIRT, GRASS]
}

func _is_tile_bound(drawn_id, neighbor_id):
	if drawn_id in binds:
		return neighbor_id in binds[drawn_id]
	return false
