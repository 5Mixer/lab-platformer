extends Area

export (PackedScene) var next_scene

func on_player_touch(body):
	get_tree().get_root().get_node("GameRoot").go_to_level(next_scene)
