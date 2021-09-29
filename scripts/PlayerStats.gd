extends Node

export(int) var max_health = 1
export var health = 1 setget set_health

signal no_health
signal health_changed(value)

func set_health(value):
	health = value
	emit_signal("health_changed", health)
	if health <= 0:
		emit_signal("no_health")
		
func _ready():
	set_health(max_health)
	
func _process(delta):
	set_health(health)
