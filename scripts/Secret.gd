extends TileMap



func _hitbox_entered(body: Node) -> void:
	if body.is_in_group("Player"):
		$AnimationPlayer.play_backwards("fade_in")


func _hitbox_exited(body: Node) -> void:
	if body.is_in_group("Player"):
		$AnimationPlayer.play("fade_in")
