extends StaticBody2D

var player_touching = false
var player = null
var height = 0

func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		player_touching = true
		player = body
		height = body.position.y
		Global.standing_on_platform = player_touching

func _on_Area2D_body_exited(body):
	if body.is_in_group("Player"):
		player_touching = false
		player = null
		Global.standing_on_platform = player_touching

func _process(delta):
	if player_touching and Input.is_action_pressed("world_down"):
		$CollisionShape2D.disabled = true
		if player.is_on_floor():
			player.position.y += 0.5
	else:
		$CollisionShape2D.disabled = false
