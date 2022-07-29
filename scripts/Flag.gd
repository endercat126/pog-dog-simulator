extends Area2D

export(String) var next_level = "res://levels/MainMenu2.tscn"

func _on_Flag_body_entered(body):
	if body.is_in_group("Player"):
		$WinSound.play()
		$"../../Fade".fade_out()
		yield($"../../Fade/AnimationPlayer", "animation_finished")
		yield($WinSound, "finished")
		get_tree().change_scene(next_level)
