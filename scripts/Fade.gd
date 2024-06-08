extends CanvasLayer

func _ready():
	visible = true
	yield(get_tree().create_timer(.1), "timeout")
	fade_in()

func fade_in():
	$AnimationPlayer.play("fade_in")
	
func fade_out():
	$AnimationPlayer.play("fade_out")

func _input(event):
	if event.is_action_pressed("menu_pause"):
		fade_out()
		yield($AnimationPlayer, "animation_finished")
		get_tree().change_scene("res://levels/MainMenu2.tscn")
