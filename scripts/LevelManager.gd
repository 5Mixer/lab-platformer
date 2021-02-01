extends Spatial

export (PackedScene) var first_level

# When the game starts, go to the designated first level
func _ready():
	go_to_level(first_level)
	
func go_to_level(level):
	# Do not go to null levels
	if level == null:
		return
	
	# Clear old level nodes
	for n in $LevelScene.get_children():
		$LevelScene.remove_child(n)
		n.queue_free()
	
	# Add new level
	$LevelScene.add_child(level.instance())
