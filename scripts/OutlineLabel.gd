extends Label

export var text_colour: Color
export var outline_color: Color
export var corners := false

func _ready():
	update_text()

func _process(delta):
	if $topbottom.text != text:
		update_text()
	
func update_text():
	add_color_override("font_color", text_colour)
	
	for label in get_children():
		if label is Label:
			label.add_color_override("font_color", outline_color)
			label.add_color_override("font_color_shadow", outline_color)
			label.text = text
			label.autowrap = autowrap
			label.clip_text = clip_text
			label.uppercase = uppercase
			label.rect_size = rect_size
			
	$tlbr.visible = corners
	$trbl.visible = corners
