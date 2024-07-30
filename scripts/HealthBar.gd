extends Control

const heart = preload("res://prefabs/Heart.tscn")
const max_in_row = 6

var hearts = []
var previous_health

func _ready():
	previous_health = Global.player_health

func _process(delta):
	rect_position = Vector2(32, 6) if Global.is_mobile else Vector2(2, 2)
	
	if Global.update_health_bar:
		updateMax()
		Global.update_health_bar = false
		
	# Update hearts
	if Global.player_health < previous_health:
		var diff = Global.player_max_health - Global.player_health
		for i in range(Global.player_max_health - diff, Global.player_max_health):
			if hearts[i].frame == 0:
				hearts[i].get_node("AnimationPlayer").play("hurt")
				
	if Global.player_health > previous_health:
		print("HEAL")
		var diff = Global.player_health - previous_health
		print(diff)
		for i in range(previous_health, previous_health + diff):
#			if hearts[i].frame == 13:
			print("HEAL2")
			hearts[i].get_node("AnimationPlayer").play("heal")	
		
	previous_health = Global.player_health

func updateMax():
	for h in hearts:
		h.queue_free()
		
	var row = 0
	var col = 0
		
	for i in range(Global.player_max_health):
		var h = heart.instance()
		
		h.position = Vector2(col, row)
		h.z_index = row
		
		col += 8
		
		if col > (max_in_row - 1) * 8:
			col = 0
			row += 4
		
		self.add_child(h)
		
		hearts.append(h)
		
		print("added heart at " + str(h.position))
