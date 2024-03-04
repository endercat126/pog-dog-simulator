extends Control

func _on_Timer_timeout():
	get_tree().change_scene("res://levels/MainMenu2.tscn")

func _process(delta):
	if Input.is_action_just_pressed("menu_go_back"):
		get_tree().change_scene("res://levels/MainMenu2.tscn")
		
	$Button.visible = Global.is_mobile

func return_to_menu():
	get_tree().change_scene("res://levels/MainMenu2.tscn")
