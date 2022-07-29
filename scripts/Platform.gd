extends StaticBody2D

var player_touching = false

func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		player_touching = true

func _on_Area2D_body_exited(body):
	if body.is_in_group("Player"):
		player_touching = false

func _process(delta):
	$CollisionShape2D.disabled = (player_touching and Input.is_action_pressed("world_down"))
