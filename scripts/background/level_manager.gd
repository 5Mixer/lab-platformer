extends Spatial

export (PackedScene) var first_level

var current_level

# When the game starts, go to the designated first level
func _ready():
	go_to_level(first_level)

func restart_level():
	# Must defer as changing the scene in a callback/during physics crashes
	call_deferred("deferred_go_to_level", current_level)
	
func go_to_level(level):
	call_deferred("deferred_go_to_level", level)
	
func on_collection():
	$timer_label.on_collect()
	pass

func get_timer_time():
	return $timer_label.current_time

func stop_timer():
	$timer_label.queue_free()
	
func deferred_go_to_level(level):
	# Do not go to null levels
	if level == null:
		return
	
	# Clear old level nodes
	for n in $level_scene.get_children():
		$level_scene.remove_child(n)
		n.queue_free()
	
	current_level = level
	
	# Add new level
	$level_scene.add_child(level.instance())
