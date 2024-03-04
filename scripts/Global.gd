extends Node

var player_health = 0
var player_max_health = 0

var player_chips = 0

var update_health_bar = false

var first_menu = true

var viewport_container
var viewport

var is_mobile = false

func _process(delta):
	is_mobile = OS.get_name() in ["Android", "iOS"]
