tool
extends TileSet

const DIRT = 0
const GRASS = 1
const STONE = 2
const SNOW = 3

var binds = {
	GRASS : [DIRT, SNOW],
	DIRT : [GRASS, SNOW, STONE],
	SNOW : [GRASS, DIRT, STONE],
	STONE : [DIRT, SNOW]
}

func _is_tile_bound(drawn_id, neighbor_id):
	if drawn_id in binds:
		return neighbor_id in binds[drawn_id]
	return false
