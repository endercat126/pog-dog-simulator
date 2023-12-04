extends AudioStreamPlayer

func _process(delta):
	if playing == false:
		play()
