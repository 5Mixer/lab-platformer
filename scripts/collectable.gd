extends Area

func _ready():
	connect("body_entered", self, "on_collect")

func on_collect(body):
	get_tree().get_root().get_node("GameRoot").on_collection()
	get_node("../../../").queue_free()
