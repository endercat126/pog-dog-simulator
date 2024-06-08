extends Control

export(String, "MainMenu", "LevelSelect", "OptionsMenu") var current_menu = "MainMenu"

func _input(event):
	if event.is_action_pressed("menu_go_back"):
		menu_go_back()
		
	
func update_menus():
	for node in $CanvasLayer.get_children():
		node.visible = current_menu == node.name

func menu_go_back():
	if current_menu in ["LevelSelect", "OptionsMenu", "Mods"]:
		switch_menu("MainMenu")
	elif current_menu == "MainMenu":
		_on_Quit_pressed()
		
	update_menus()

func switch_menu(menu: String):
	$Fade/Control/AnimationPlayer.play("out")
	yield($Fade/Control/AnimationPlayer, "animation_finished")
	current_menu = menu
	update_menus()
	if current_menu == "LevelSelect":
		get_tree().change_scene("res://levels/DEMO/DemoLevel1.tscn")
	$Fade/Control/AnimationPlayer.play("in")
	
func open_url(url: String):
	OS.shell_open(url)

func _on_Quit_pressed():
	$Fade/Control/AnimationPlayer.play("out")
	yield($Fade/Control/AnimationPlayer, "animation_finished")
	get_tree().quit()
