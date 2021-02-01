extends Area

export (PackedScene) var next_scene

func on_player_touch(body):
	if next_scene != null:
		get_tree().change_scene_to(next_scene)
