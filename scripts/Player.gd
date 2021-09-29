extends KinematicBody2D


const UP = Vector2(0, -1)

var motion = Vector2()
var prev_motion = Vector2()
var can_jump = true

export var speed = 60
export var gravity = 0.1
export var jump_power = 2.6
export var max_jumps = 2

onready var jumps_left = max_jumps + 1


func _physics_process(delta):
	motion.y += gravity
	
	if Input.is_action_pressed("move_left"):
		motion.x = -1
		prev_motion.x = -1
	elif Input.is_action_pressed("move_right"):
		motion.x = 1
		prev_motion.x = 1
	else:
		motion.x = 0
		
	if is_on_floor():
		motion.y = 0.04
		can_jump = true
		jumps_left = max_jumps
		
		if motion.x == 0:
			$AnimationPlayer.play("idle")
		else:
			$AnimationPlayer.play("walk")
	else:
		$AnimationPlayer.stop()
		if motion.y < 0:
			$Sprite.frame = 6
			
	if prev_motion.x > 0:
		$Sprite.flip_h = false
	else:
		$Sprite.flip_h = true
		
	if Input.is_action_just_pressed("jump") and can_jump:
		motion.y = -jump_power
		can_jump = false
		jumps_left -= 1
		$JumpTimer.start()
		
	if $JumpTimer.is_stopped() and jumps_left > 0:
		can_jump = true
		
	if is_on_ceiling():
		motion.y = 0.08
		
	move_and_slide(motion * speed, UP)
