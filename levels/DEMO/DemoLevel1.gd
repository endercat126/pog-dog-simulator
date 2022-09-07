extends Node2D

func _ready():
	Global.viewport_container = $ViewportContainer
	Global.viewport = $ViewportContainer/Viewport
