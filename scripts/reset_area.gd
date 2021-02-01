extends Area

func _ready():
	connect("body_entered", self, "on_body_entered")

func on_body_entered(body):
	get_tree().get_root().get_node("GameRoot").restart_level()
