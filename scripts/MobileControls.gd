extends CanvasLayer

func _ready():
	pass

func _process(delta):
	self.visible = Global.is_mobile

func simulate_input(input_name: String, pressed: int):
	if pressed == 1:
		Input.action_press(input_name)
	elif pressed == 0:
		Input.action_release(input_name)
	elif pressed == 2:
		Input.action_press(input_name)
		yield(get_tree().create_timer(0.01), "timeout")
		Input.action_release(input_name)
