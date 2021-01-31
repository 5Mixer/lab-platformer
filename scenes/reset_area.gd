extends Area

func on_body_entered(body):
	get_tree().reload_current_scene()
