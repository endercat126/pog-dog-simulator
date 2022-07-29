extends Area2D

var player = null
export(int, "Regular", "Gold", "Ice") var spike_type = 0

func _on_spike_touched(body):
	if body.is_in_group("Player"):
		player = body

func _on_spike_touch_ended(body):
	if body.is_in_group("Player"):
		player = null

func _ready():
	$Sprite.frame = spike_type

func _process(delta):
	if player != null:
		if player.get_node("HurtTimer").is_stopped():
			player.get_node("HurtTimer").start()
			if spike_type == 1:
				player.hurt(2)
			else:
				player.hurt(1)

