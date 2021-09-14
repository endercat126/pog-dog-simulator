extends Area2D

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player":
			print("player collide")
			if body.can_collect_chip:
				body.collect_chips(1)
				self.queue_free()
