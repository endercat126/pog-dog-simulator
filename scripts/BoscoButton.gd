extends Button

func _process(delta):
	get_parent().get_node("TextureRect").visible = is_hovered()
