extends Area2D



func _on_TV_body_entered(body: Node) -> void:
	print("tv: body entered")
	if body.is_in_group("Player") and $Timer.is_stopped():
		Global.crt_effect.visible = not Global.crt_effect.visible
		$AudioStreamPlayer.play()
		$Timer.start()
