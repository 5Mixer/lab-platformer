extends Area

func on_body_entered(body):
	get_tree().get_root().get_node("GameRoot").restart_level()
