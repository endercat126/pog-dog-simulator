extends Control

#func _process(delta):
#	if OS.get_datetime().hour in range(6, 20):
#		var res = load($Background.texture.resource_path)
#	else:
#		print("It is night.")

func _on_play_pressed():
	$Fade.fade_out()
	yield($Fade/AnimationPlayer, "animation_finished")
	get_tree().change_scene("res://levels/LevelSelect.tscn")


func _on_options_pressed():
	pass # Replace with function body.


func _on_credits_pressed():
	pass # Replace with function body.


func _on_quit_pressed():
	$Fade.fade_out()
	yield($Fade/AnimationPlayer, "animation_finished")
	get_tree().quit()


func _on_discord_pressed():
	OS.shell_open("https://discord.gg/NR8cMMmZ6R")
