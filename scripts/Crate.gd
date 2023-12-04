extends StaticBody2D
var exploded = false
var crate_health = 3

func _on_hit_from_bottom(body):
	if body.is_in_group("Player") and not exploded:
		if body.get_node("CrateTimer").is_stopped():
			body.get_node("CrateTimer").start()
			if $Sprite.frame == 0:
				body.get_node("ChipSound").play()
				body.chips += 2
				queue_free()
			elif $Sprite.frame == 1:
				pass
			if $Sprite.frame == 2:
				body.get_node("ChipSound").play()
				body.chips += 5
				queue_free()
			elif $Sprite.frame == 3:
				body.get_node("ExplodeSound").play()
				body.hurt(2)
				$CollisionShape2D.disabled = true
				exploded = true
				$AnimationPlayer.play("explode")
			elif $Sprite.frame == 4:
				body.get_node("ExplodeSound").play()
				body.hurt(Global.player_max_health)
				$CollisionShape2D.disabled = true
				exploded = true
				$AnimationPlayer.play("explode")
			elif $Sprite.frame == 5:
				body.get_node("ChipSound").play()
				body.chips += 1
				crate_health -= 1
				if crate_health == 0:
					queue_free()

func _process(delta):
	if exploded and $AnimationPlayer.is_playing() == false:
		queue_free()
