extends Area

func _ready():
	connect("body_entered", self, "on_collect")

func on_collect(body):
	if body.has_method("collect"):
		body.collect()
	get_tree().get_root().get_node("game_root").on_collection()
	owner.queue_free()
