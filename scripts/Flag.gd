extends Area2D

export(PackedScene) var next_level

func _on_Flag_body_entered(body):
	if body.is_in_group("Player"):
		$WinSound.play()
		$"../../Fade".fade_out()
		yield($"../../Fade/AnimationPlayer", "animation_finished")
		yield($WinSound, "finished")
		get_tree().change_scene_to(next_level)
