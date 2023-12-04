extends CanvasLayer

func _ready():
	if not Global.first_menu:
		$Control/AnimationPlayer.play("in")
