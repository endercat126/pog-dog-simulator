extends TileMap

#const ice_slip = preload("res://objects/Ice.tscn")
#const chip = preload("res://objects/Chip.tscn")
#const spike = preload("res://objects/Spike.tscn")
const crate = preload("res://prefabs/Crate.tscn")
const chip = preload("res://prefabs/Chip.tscn")
const barrier = preload("res://prefabs/Barrier.tscn")
const spike = preload("res://prefabs/Spike.tscn")
const platform = preload("res://prefabs/Platform.tscn")
#
const AIR = -1
const WOOD_CRATE = 3
const METAL_CRATE = 4
const GOLD_CRATE = 5
const EXPLOSIVE_CRATE = 6
const NUKE_CRATE = 7
const BARRED_CRATE = 8
const METAL_SPIKE = 13
const GOLD_SPIKE = 14
const ICE_SPIKE = 15
const PLATFORM_1 = 9
const PLATFORM_2 = 10
const PLATFORM_3 = 11
const PLATFORM_4 = 12
const BARRIER = 20
const CHIP = 16
const GOLD_CHIP = 17
const SPICY_CHIP = 18
const DIP_CHIP = 19

func _ready():
	var wood_crate_tiles = get_used_cells_by_id(WOOD_CRATE)
	var metal_crate_tiles = get_used_cells_by_id(METAL_CRATE)
	var gold_crate_tiles = get_used_cells_by_id(GOLD_CRATE)
	var explosive_crate_tiles = get_used_cells_by_id(EXPLOSIVE_CRATE)
	var nuke_crate_tiles = get_used_cells_by_id(NUKE_CRATE)
	var barred_crate_tiles = get_used_cells_by_id(BARRED_CRATE)
	var metal_spike_tiles = get_used_cells_by_id(METAL_SPIKE)
	var gold_spike_tiles = get_used_cells_by_id(GOLD_SPIKE)
	var ice_spike_tiles = get_used_cells_by_id(ICE_SPIKE)
	var platform_1_tiles = get_used_cells_by_id(PLATFORM_1)
	var platform_2_tiles = get_used_cells_by_id(PLATFORM_2)
	var platform_3_tiles = get_used_cells_by_id(PLATFORM_3)
	var platform_4_tiles = get_used_cells_by_id(PLATFORM_4)
	var barrier_tiles = get_used_cells_by_id(BARRIER)
	var chip_tiles = get_used_cells_by_id(CHIP)
	var gold_chip_tiles = get_used_cells_by_id(GOLD_CHIP)
	var spicy_chip_tiles = get_used_cells_by_id(SPICY_CHIP)
	var dip_chip_tiles = get_used_cells_by_id(DIP_CHIP)

#
#	replace_ice(ice_tiles)
#	replace_chips(chip_tiles)
#	replace_spikes(spike_tiles, 0)
#	replace_spikes(ice_spike_tiles, 1)
	replace_crates(wood_crate_tiles, 0)
	replace_crates(metal_crate_tiles, 1)
	replace_crates(gold_crate_tiles, 2)
	replace_crates(explosive_crate_tiles, 3)
	replace_crates(nuke_crate_tiles, 4)
	replace_crates(barred_crate_tiles, 5)
	replace_chips(chip_tiles, 0)
	replace_chips(gold_chip_tiles, 1)
	replace_chips(spicy_chip_tiles, 2)
	replace_chips(dip_chip_tiles, 3)
	replace_barriers(barrier_tiles)
	replace_platforms(platform_1_tiles, 0)
	replace_platforms(platform_2_tiles, 1)
	replace_platforms(platform_3_tiles, 2)
	replace_platforms(platform_4_tiles, 3)
	replace_spikes(metal_spike_tiles, 0)
	replace_spikes(gold_spike_tiles, 1)
	replace_spikes(ice_spike_tiles, 2)
	
func replace_chips(tile_array, chip_type):
	var tile_pos
	for i in range(0, tile_array.size()):
		var new_chip = chip.instance()
		tile_pos = map_to_world(tile_array[i])
		new_chip.position = tile_pos
		new_chip.chip_type = chip_type
		set_cell(tile_array[i].x, tile_array[i].y, AIR)
		self.add_child(new_chip)

func replace_platforms(tile_array, type):
	var tile_pos
	for i in range(0, tile_array.size()):
		var new_platform = platform.instance()
		tile_pos = map_to_world(tile_array[i])
		new_platform.position = tile_pos
		new_platform.get_node("Sprite").frame = type
		set_cell(tile_array[i].x, tile_array[i].y, AIR)
		self.add_child(new_platform)
	
	
#func replace_ice(tile_array):
#	var tile_pos
#	for i in range(0, tile_array.size()):
#		var new_ice = ice_slip.instance()
#		tile_pos = map_to_world(tile_array[i])
#		new_ice.position = tile_pos
#		self.add_child(new_ice)
#
#func replace_chips(tile_array):
#	var tile_pos
#	for i in range(0, tile_array.size()):
#		var new_chip = chip.instance()
#		tile_pos = map_to_world(tile_array[i])
#		new_chip.set_position(tile_pos)
#		set_cell(tile_array[i].x, tile_array[i].y, AIR)
#		self.add_child(new_chip)
#
func replace_spikes(tile_array, spike_type):
	var tile_pos
	for i in range(0, tile_array.size()):
		var new_spike = spike.instance()
		tile_pos = map_to_world(tile_array[i])
		new_spike.position = tile_pos
		new_spike.spike_type = spike_type
		set_cell(tile_array[i].x, tile_array[i].y, AIR)
		self.add_child(new_spike)
#
func replace_crates(tile_array, crate_type):
	var tile_pos
	for i in range(0, tile_array.size()):
		var new_crate = crate.instance()
		tile_pos = map_to_world(tile_array[i])
		new_crate.position = tile_pos
		new_crate.get_node("Sprite").frame = crate_type
		set_cell(tile_array[i].x, tile_array[i].y, AIR)
		self.get_node("../ForegroundObjects").add_child(new_crate)
		
#func replace_chips(tile_array):
#	var tile_pos
#	for i in range(0, tile_array.size()):
#		var new_chip = chip.instance()
#		tile_pos = map_to_world(tile_array[i])
#		new_chip.set_position(tile_pos)
#		set_cell(tile_array[i].x, tile_array[i].y, AIR)
#		self.get_node("../ForegroundObjects").add_child(new_chip)

func replace_barriers(tile_array):
	var tile_pos
	for i in range(0, tile_array.size()):
		var new_barrier = barrier.instance()
		tile_pos = map_to_world(tile_array[i])
		new_barrier.position = tile_pos
		set_cell(tile_array[i].x, tile_array[i].y, AIR)
		self.get_node("../ForegroundObjects").add_child(new_barrier)
