# Extends KinematicBody2D because this script is on a KinematicBody2D node
extends KinematicBody2D

# Define Variables
const UP = Vector2(0, -1)

var motion = Vector2()
var can_jump = true
var direction = 0
var facing = 1

var jumps_left = 1
var is_jumping = false
var fall_time = 0

var health = 5
var spawn_point = Vector2()
var dead = false
var chips = 0

var initial_speed
var initial_jumps

# Editor variables
export var max_health = 5
export var speed = 70
export var gravity = 5
export var friction = 1000
export var acceleration = 30
export var jump_power = 120
export var jumps = 1
export var jump_time_after_fall = 10
export(int, "Left", "Right") var initial_direction = 1

# Set initial variables
func _ready():
	jumps_left = jumps
	facing = initial_direction * 2 - 1
	health = max_health
	spawn_point = position
	initial_speed = speed
	initial_jumps = jumps
	
	# Update health bar
	Global.player_max_health = max_health
	Global.player_health = health
	Global.update_health_bar = true
	
	Global.connect("down_platform", self, "_down_platform")
	

# On physics update
func _physics_process(delta):
	
	if dead:
		return
	
	# Apply gravity
	if !is_on_floor():
		motion.y += gravity
	
	# Set direction and apply motion
	direction = -int(Input.is_action_pressed("world_left")) + int(Input.is_action_pressed("world_right"))
	
	if direction != 0:
		facing = direction
		motion.x += direction * acceleration
		motion.x = clamp(motion.x, -speed, speed)
	else:
		motion.x = move_toward(motion.x, 0, friction)
	
	# Move the player
	motion = move_and_slide(motion, UP)
	
	# Jumping
	if Input.is_action_just_pressed("world_jump") and can_jump and jumps_left > 0:
		jumps_left = 0
		is_jumping = true
		motion.y = -jump_power
		can_jump = false
		$JumpTimer.start()
		$JumpSound.play()
		
	if Input.is_action_just_pressed("world_jump") and !is_on_floor():
		$StoreJumpTimer.start()
		
	if !$StoreJumpTimer.is_stopped() and is_on_floor():
		jumps_left = 0
		is_jumping = true
		motion.y = -jump_power
		can_jump = false
		$JumpTimer.start()
		$JumpSound.play()

	if $JumpTimer.is_stopped() and jumps_left > 0:
		can_jump = true
		
#	if Input.is_action_just_released("world_jump"): # Hold jump button for longer jump
#		motion.y = motion.y * 0.5
		
	# Hit head on ceiling
	if is_on_ceiling():
		motion.y = 20
	
	# Animation
	$Bosco.scale.x = facing
	$Collar.scale.x = facing
	
	if is_on_floor():
		if !is_jumping:
			motion.y = 0
			jumps_left = jumps
		
		can_jump = true
		is_jumping = false
		
		fall_time = 0
		
		if motion.x == 0:
			$AnimationPlayer.play("idle")
		else:
			$AnimationPlayer.play("walk")
	else:
		if !is_jumping:
			fall_time += 1
			if fall_time > jump_time_after_fall:
				jumps_left = jumps - 1
		
#		$AnimationPlayer.stop()
#		if motion.y < 0:
#			$Sprite.frame = 6

# Update function
func _process(delta):
	# Update health bar
	if Global.player_max_health != max_health:
		Global.player_max_health = max_health
		Global.update_health_bar = true
		
	Global.player_health = health
	Global.player_chips = chips
	
	$Camera2D.zoom = Vector2(0.75, 0.75) if Global.is_mobile else Vector2.ONE
	
	if $RespawnTimer.is_stopped() and dead:
		dead = false
		respawn()

func hurt(damage):
	if not dead:
		health -= damage
		if health < 1:
			health = 0
			die()
			
		$HurtSound.play()
		$HurtAnim.play("hurt")
			
		print("Player took " + str(damage) + " damage!")
	else:
		print("Can't take damage, the player is already dead!")
	
func heal(amount):
	health += amount
	if health > max_health:
		health = max_health
		
	$HealSound.play()
	$HurtAnim.play("heal")
		
	print("Player healed " + str(amount) + " health!")
	
func die():
	dead = true
	$AnimationPlayer.play("death")
	$AnimationPlayer.playback_speed = 3
	get_node("../Fade").fade_out()
	$RespawnTimer.start()
	print("Player died!")
	speed = 0
	jumps = 0
	jumps_left = 0
	
func respawn():
	get_tree().reload_current_scene()
	chips = 0
	health = max_health
	position = spawn_point
	print("Player respawned!")
	facing = initial_direction * 2 - 1
	speed = initial_speed
	jumps = initial_jumps
	jumps_left = jumps
	get_node("../Fade").fade_in()
