extends AudioStreamPlayer

func _ready():
	bus = "Music"

func _process(delta):
	if playing == false:
		play()
