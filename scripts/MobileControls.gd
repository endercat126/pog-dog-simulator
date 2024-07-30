extends CanvasLayer

var actions = []

func _ready():
	bind($LR/Left, "world_left")
	bind($LR/Right, "world_right")
	bind($J/Jump, "world_jump")
	bind($J/Down, "world_down")
	bind($M/Menu, "menu_pause")
	
	for action in actions:
		Input.action_release(action)

func _process(delta):
	self.visible = Global.is_mobile
	$J/Down.visible = Global.standing_on_platform

func bind(node: Node2D, input: String) -> void:
	while not node:
		yield(get_tree().create_timer(0.01), "timeout")
	
	actions.append(input)
	node.connect("pressed", Input, "action_press", [input])
	node.connect("released", Input, "action_release", [input])
