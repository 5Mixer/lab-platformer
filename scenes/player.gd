extends KinematicBody

export var gravity = -.5
export var speed = 10
export var turn_speed = .05
export var jump_velocity = 15

var velocity = Vector3()

func _physics_process(delta):
	var input_velocity = Vector3()
	if Input.is_action_pressed("forward"):
		input_velocity += global_transform.basis.z * speed
	if Input.is_action_pressed("back"):
		input_velocity -= global_transform.basis.z * speed
	
	velocity.x = input_velocity.x
	velocity.z = input_velocity.z
		
	if Input.is_action_pressed("left"):
		rotate_y(-turn_speed)
	if Input.is_action_pressed("right"):
		rotate_y(turn_speed)
		
	velocity.y += gravity
	
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = jump_velocity
	
	velocity = move_and_slide(velocity, Vector3.UP)
