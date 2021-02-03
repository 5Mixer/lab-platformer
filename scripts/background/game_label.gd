extends Label

var count_upwards = true
export var current_time = 0.0
export var points = 0
export var lives = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func on_collect():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if count_upwards:
		current_time += delta
	else:
		current_time -= delta
	
	# Modify this line to customise what text is shown.
	# %2.2f inserts a decimal number
	# %d inserts an integer (whole) number
	# \n means 'newline'
	text = "Time: %2.2f" % [current_time]
