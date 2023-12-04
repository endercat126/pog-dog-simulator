extends CanvasLayer

func _ready():
	yield(get_tree().create_timer(.1), "timeout")
	fade_in()

func fade_in():
	$AnimationPlayer.play("fade_in")
	
func fade_out():
	$AnimationPlayer.play("fade_out")
