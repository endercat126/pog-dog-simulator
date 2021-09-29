extends Sprite


var heart_size = 8

export var max_hp = 4 setget set_max_hp
export var value = 1.0


func set_max_hp(h):
	for i in range(h):
		region_rect.size.x = h * heart_size
		
func _ready():
	set_max_hp(max_hp)

func _process(delta):
	if value > 0.5:
		$AnimationPlayer.play("full")
	elif value > 0:
		$AnimationPlayer.play("half")
	else:
		$AnimationPlayer.play("empty")
