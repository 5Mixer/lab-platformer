extends Area

export var launch_force_multiplier = 1.0
export var launch_upwards_velocity = 1.0

func _ready():
	# Make collisions run the 'on_launch_area_entered' function
	connect("body_entered", self, "on_launch_area_entered")

func on_launch_area_entered(body):
	if body.has_method("launch"):
		body.launch(launch_force_multiplier, launch_upwards_velocity)
