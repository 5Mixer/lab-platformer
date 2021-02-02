extends Area

export (PackedScene) var next_scene

func _ready():
	connect("body_entered", self, "on_player_touch")

func on_player_touch(_body):
	get_tree().get_root().get_node("game_root").go_to_level(next_scene)
