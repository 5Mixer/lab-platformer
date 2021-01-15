extends KinematicBody

export var gravity = -30
export var speed = 10

func get_input_movement():
	var direction = Vector3()
	
	if Input.is_action_pressed("forward"):
		direction += global_transform.basis.z
	if Input.is_action_pressed("back"):
		direction -= global_transform.basis.z
	if Input.is_action_pressed("left"):
		direction += global_transform.basis.x
	if Input.is_action_pressed("right"):
		direction -= global_transform.basis.x
	
	# Normalise so that moving diagonally is not faster.
	direction = direction.normalized()
	return direction

func _physics_process(delta):
	var movement_velocity = get_input_movement() * speed
	
	move_and_slide(movement_velocity, Vector3.UP)
