extends KinematicBody

export var gravity = -30
export var speed = 10
export var turn_speed = .05

func get_input_movement():
	var direction = Vector3()
	
	if Input.is_action_pressed("forward"):
		direction += global_transform.basis.z
	if Input.is_action_pressed("back"):
		direction -= global_transform.basis.z
	if Input.is_action_pressed("left"):
		rotate_y(turn_speed)
	if Input.is_action_pressed("right"):
		rotate_y(-turn_speed)
	
	# Normalise so that moving diagonally is not faster.
	direction = direction.normalized()
	return direction

func _physics_process(delta):
	var movement_velocity = get_input_movement() * speed
	
	move_and_slide(movement_velocity, Vector3.UP)
