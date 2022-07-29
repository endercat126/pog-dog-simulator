extends Control

func _process(delta):
	var chips = Global.player_chips
	
	$Label.text = str(chips)
	$Label/Label2.text = str(chips)
