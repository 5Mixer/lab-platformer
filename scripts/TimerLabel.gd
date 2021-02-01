extends Label

export var count_upwards = true
export var current_time = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func on_collect():
	current_time = max(current_time - 5, 0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if count_upwards:
		current_time += delta
	else:
		current_time -= delta
	
	text = "%2.2f" % current_time
