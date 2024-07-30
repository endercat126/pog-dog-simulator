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
	$Fade.fade_out()
	yield($Fade/AnimationPlayer, "animation_finished")
	current_menu = menu
	update_menus()
	if current_menu == "LevelSelect":
		get_tree().change_scene("res://levels/Summer/Summer1.tscn")
	$Fade.fade_in()
	
func open_url(url: String):
	OS.shell_open(url)

func _on_Quit_pressed():
	$Fade.fade_out()
	yield($Fade/AnimationPlayer, "animation_finished")
	get_tree().quit()




onready var fullscreen_button = $CanvasLayer/OptionsMenu/MarginContainer/VBoxContainer/Right/GraphicsPanel/Fullscreen
onready var language_dropdown = $CanvasLayer/OptionsMenu/MarginContainer/VBoxContainer/Left/LanguagePanel/OptionButton


func toggle_fullscreen():
	print("fs")

	OS.window_fullscreen = !OS.window_fullscreen
	
	if OS.window_fullscreen:
		fullscreen_button.text = "Windowed"
	else:
		fullscreen_button.text = "Fullscreen"


func _ready():
	$CanvasLayer/MainMenu/Label.text = Global.VERSION
	if OS.window_fullscreen:
		fullscreen_button.text = "Windowed"
	else:
		fullscreen_button.text = "Fullscreen"

	# add language options
	language_dropdown.add_item("English")
	language_dropdown.add_item("French")
	language_dropdown.add_item("Swedish")
	language_dropdown.add_item("Japanese")

