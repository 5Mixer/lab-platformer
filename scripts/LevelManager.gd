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
	$TimerLabel.on_collect()
	
func deferred_go_to_level(level):
	# Do not go to null levels
	if level == null:
		return
	
	# Clear old level nodes
	for n in $LevelScene.get_children():
		$LevelScene.remove_child(n)
		n.queue_free()
	
	current_level = level
	
	# Add new level
	$LevelScene.add_child(level.instance())
