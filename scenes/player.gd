extends KinematicBody

export var gravity = -.5
export var speed = 10
export var turn_speed = .05
export var jump_velocity = 15
export var movement_dampening_floor = .7
export var movement_dampening_air = .8

var velocity = Vector3()

func launch(launch_force_multiplier, launch_upwards_velocity):
	velocity = Vector3(velocity.x*launch_force_multiplier, launch_upwards_velocity, velocity.z*launch_force_multiplier)

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _unhandled_input(event):
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x * .004);
		$rotation_helper.rotate_x(event.relative.y * .004);

func _physics_process(delta):
	var input_velocity = Vector3()
	
	if Input.is_action_pressed("forward"):
		input_velocity += global_transform.basis.z * speed
	if Input.is_action_pressed("back"):
		input_velocity -= global_transform.basis.z * speed
	
	if Input.is_action_pressed("left"):
		input_velocity += global_transform.basis.x * speed
	if Input.is_action_pressed("right"):
		input_velocity -= global_transform.basis.x * speed
	
	velocity.x += input_velocity.x
	velocity.z += input_velocity.z
		
		
	velocity.y += gravity
	
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = jump_velocity
	
	velocity = move_and_slide(velocity, Vector3.UP)
	if is_on_floor():
		velocity.x *= movement_dampening_floor
		velocity.z *= movement_dampening_floor
	else:
		velocity.x *= movement_dampening_air
		velocity.z *= movement_dampening_air
