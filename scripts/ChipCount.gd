extends Control

func _process(delta):
	var chips = Global.player_chips
	
	$Label.text = str(chips)
	$Label/Label2.text = str(chips)

	margin_right = -32 if Global.is_mobile else -2
	rect_position.y = 6 if Global.is_mobile else 2
