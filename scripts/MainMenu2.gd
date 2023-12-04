extends Control



func _on_Discord_pressed():
	OS.shell_open("https://discord.gg/NR8cMMmZ6R")


func _on_Itch_pressed():
	OS.shell_open("https://endercatstudios.itch.io/")


func _on_Play_pressed():
	$Fade/Control/AnimationPlayer.play("out")
	yield($Fade/Control/AnimationPlayer, "animation_finished")
	get_tree().change_scene("res://levels/DEMO/DemoLevel1.tscn")


func _on_Options_pressed():
	pass # Replace with function body.


func _on_Quit_pressed():
	$Fade/Control/AnimationPlayer.play("out")
	yield($Fade/Control/AnimationPlayer, "animation_finished")
	get_tree().quit()
