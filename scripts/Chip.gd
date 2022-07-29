extends Area2D

var chip_type = 0

func _on_chip_touched(body):
	if body.is_in_group("Player"):
		body.chips += 1
		body.get_node("ChipSound").play()
		print("Chips: " + str(body.chips))
		queue_free()
