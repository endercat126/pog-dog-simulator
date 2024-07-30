# Extends KinematicBody2D because this script is on a KinematicBody2D node
extends KinematicBody2D

# Define Variables
const UP = Vector2(0, -1)

var motion = Vector2()
var direction = 0
var player = null

# Sprites
onready var sprites = [
	preload("res://sprites/enemies/squirrel/brown.png"),
	preload("res://sprites/enemies/squirrel/grey.png"),
	preload("res://sprites/enemies/squirrel/red.png")
]

# Editor variables
export(int, "Brown", "Grey", "Red") var type = 0
export var speed = 70
export var acceleration = 30
export var gravity = 5
export(int, "Left", "Right") var initial_direction = 1

func _ready() -> void:
	direction = initial_direction * 2 - 1
	$Sprite.flip_h = !bool(initial_direction)
	$Sprite.texture = sprites[type]

func _process(delta: float) -> void:
	# Hurt the player
	if player != null:
		if player.get_node("HurtTimer").is_stopped():
			player.get_node("HurtTimer").start()
			player.hurt(1)

func _physics_process(delta: float) -> void:
	# Apply gravity
	if !is_on_floor():
		motion.y += gravity
		
	if is_on_wall():
		direction = -direction
		$Sprite.flip_h = !$Sprite.flip_h
		
	# Apply movement
	motion.x += direction * acceleration
	motion.x = clamp(motion.x, -speed, speed)
		
	# Move the enemy
	motion = move_and_slide(motion, UP)

func _hitbox_entered(body: Node) -> void:
	if body.is_in_group("Player"):
		player = body

func _hitbox_exited(body: Node) -> void:
	if body.is_in_group("Player"):
		player = null
