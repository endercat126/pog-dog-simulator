extends Node

var player_health = 0
var player_max_health = 0
var player_chips = 0
var update_health_bar = false

var effect_scene = preload("res://prefabs/FX.tscn")

var crt_effect: CanvasLayer

var is_mobile = false
var standing_on_platform = false

const VERSION = '0.5.0-beta'

func _ready() -> void:
	crt_effect = effect_scene.instance()
	crt_effect.visible = false
	add_child(crt_effect)

func _process(delta):
	is_mobile = OS.get_name() in ["Android", "iOS"]
