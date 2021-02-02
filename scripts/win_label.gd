extends Label


func _ready():
	var time = get_tree().get_root().get_node("game_root").get_timer_time()
	text = "You won in %2.2f seconds!" % time
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _process(delta):
	if Input.is_action_just_pressed("escape") or Input.is_action_just_pressed("mouse_click"):
		get_tree().reload_current_scene()
