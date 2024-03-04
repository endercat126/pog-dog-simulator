extends Control

func return_to_menu():
	$Fade.fade_out()
	yield($Fade/AnimationPlayer, "animation_finished")
	get_tree().change_scene("res://levels/MainMenu2.tscn")
