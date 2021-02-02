extends Label

export var count_upwards = true
export var current_time = 0.0
export var collectable_timer_reduction = 3.0

func _ready():
	pass

func on_collect():
	current_time = max(current_time - collectable_timer_reduction, 0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if count_upwards:
		current_time += delta
	else:
		current_time -= delta
	
	text = "%2.2f" % current_time
