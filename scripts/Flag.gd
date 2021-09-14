extends Area2D

export(String, "Spawn", "Checkpoint", "Finish") var type = "Spawn"
var active = false

onready var textures = {
	"Spawn": preload("res://textures/objects/flag_spawn.png"),
	"Checkpoint": preload("res://textures/objects/flag_checkpoint_inactive.png"),
	"Finish": preload("res://textures/objects/flag_finish.png")
}

func _ready():
	$Sprite.texture = textures[type]
	
	name = type
