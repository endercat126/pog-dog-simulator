extends ParallaxBackground

export(int, "Sky Day", "Sky Night", "Mountains Day", "Mountains Night", "Snow Day", "Snow Night", "Snow Day Trees", "Snow Night Trees") var background = 0

var backgrounds = {
	0 : [4, 0],	# Sky Day
	1 : [5, 1],	# Sky Night
	2 : [1, 0],	# Mountains Day
	3 : [2, 1],	# Mountains Night
	4 : [0, 0],	# Snow Day
	5 : [6, 1],	# Snow Night
	6 : [2, 0],	# Snow Day Trees
	7 : [3, 1]	# Snow Night Trees
}

func _process(delta):
	$Background/Main.frame = backgrounds[background][0]
	$Sun/Main.frame = backgrounds[background][1]
