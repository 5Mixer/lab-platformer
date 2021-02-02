extends Area

export (PackedScene) var next_scene

func _ready():
	# Make collisions run the 'on_player_touch' function
	connect("body_entered", self, "on_player_touch")

# When the player touches the level end marker, go to the next level
func on_player_touch(_body):
	get_tree().get_root().get_node("game_root").go_to_level(next_scene)
