extends KinematicBody2D


const UP = Vector2(0, -1)

var motion = Vector2()
var prev_motion = Vector2()
var can_jump = false
var can_collect_chip = true

export var speed = 60
export var gravity = 0.1
export var jump_power = 2.6
export var jump_time = 0.4
export var max_jumps = 2
export var max_hp = 4

onready var chips = 0 setget set_chips
onready var jumps_left = max_jumps + 1
onready var hp = max_hp setget set_health


func collect_chips(amount):
	set_chips(chips + amount)
	
func damage(amount):
	set_health(hp - amount)
	
func heal(amount):
	set_health(hp + amount)

func set_health(value):
	var current_hp = hp
	if value > current_hp:
		hp = max(value, max_hp)
		$HealSound.play()
	else:
		hp = value
		$HurtSound.play()
	
	
func set_chips(value):
	var current_chips = chips
	if value > current_chips:
		for c in value - current_chips:
			chips += 1
			can_collect_chip = false
			$ChipSound.play()
			$ChipTimer.start()
			yield($ChipTimer, "timeout")
			can_collect_chip = true
	else:
		chips = value

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
		
	if Input.is_action_pressed("jump") and can_jump:
		motion.y = -jump_power
		can_jump = false
		jumps_left -= 1
		$DoubleJumpTimer.start()
		$JumpSound.play()
	
	if $DoubleJumpTimer.is_stopped() and jumps_left > 0:
		can_jump = true

	if is_on_ceiling():
		motion.y = 0.08
		
	move_and_slide(motion * speed, UP)
