extends Area2D

var player = null

func _process(delta):
	if player != null:
		if player.get_node("HurtTimer").is_stopped():
			player.get_node("HurtTimer").start()
			player.hurt(1)

func _on_Bee_body_entered(body):
	if body.is_in_group("Player"):
		player = body

func _on_Bee_body_exited(body):
	if body.is_in_group("Player"):
		player = null
