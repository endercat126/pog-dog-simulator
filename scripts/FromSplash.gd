extends CanvasLayer

func _ready():
	if Global.first_menu:
		$Control/AnimationPlayer.play("fade")
		Global.first_menu = false
	else:
		$Control.visible = false
