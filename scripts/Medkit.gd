extends Area2D

var player = null

func _process(delta):
	if player != null:
		if player.get_node("ChipTimer").is_stopped() and player.health < player.max_health:
			player.get_node("ChipTimer").start()
			player.heal(1)

func _on_Medkit_body_entered(body):
	if body.is_in_group("Player"):
		player = body

func _on_Medkit_body_exited(body):
	if body.is_in_group("Player"):
		player = null
