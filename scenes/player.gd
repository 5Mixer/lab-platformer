extends KinematicBody

export var gravity = -.5                   # Vertical acceleration value. Negative for downwards gravity.
export var speed = 10                      # Keyboard controls speed
export var mouse_sensitivity = .004        # A multiplier for much the mouse should rotate the player
export var jump_velocity = 15              # The upwards velocity ('speed') applied when jumping
export var movement_dampening_floor = .7   # The speed multiplier of the player in the ground. Less than one slows.
export var movement_dampening_air = .8     # The speed multiplier of the player in the air. Usually less than floor multiplier, for greater air movement
export var max_jumps = 1                   # The number of jumps the player can do before touching the ground. 2 for double jumps.

var velocity = Vector3()                   # The current movement vector/direction of the player (contains values for the x direction, y direction, z direction)
var jumps = 0                              # The number of jumps the player has performed. 0 on ground.

#  A function (block of code) that runs when the player is created
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED) # Stop the mouse from leaving the window

# A function that runs when the player touches a launch block
func launch(launch_force_multiplier, launch_upwards_velocity):
	velocity = Vector3(velocity.x*launch_force_multiplier, launch_upwards_velocity, velocity.z*launch_force_multiplier)

# A function that Godot runs when some input (like mouse or keyboard input) happens
func _unhandled_input(event):
	# Make the player rotate the player
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x * mouse_sensitivity);
		$rotation_helper.rotate_x(event.relative.y * mouse_sensitivity); # A seperate rotation helper as applying two rotations on different axis' causes strange results!

func _physics_process(delta):
	# A variable to store the direction that the player is moving in with their keyboard
	var input_velocity = Vector3()
	
	# For each keyboard button, move us in the appropriate direction
	if Input.is_action_pressed("forward"):
		input_velocity += global_transform.basis.z * speed
	if Input.is_action_pressed("back"):
		input_velocity -= global_transform.basis.z * speed
	if Input.is_action_pressed("left"):
		input_velocity += global_transform.basis.x * speed
	if Input.is_action_pressed("right"):
		input_velocity -= global_transform.basis.x * speed
	
	# Apply the keyboard ('input') velocity to the actual player velocity
	velocity.x += input_velocity.x
	velocity.z += input_velocity.z
	
	velocity.y += gravity # Apply gravity
	
	if is_on_floor(): # Reset the jumps counter when touching the ground
		jumps = 0
	
	if Input.is_action_just_pressed("jump") and jumps < max_jumps: # If the jump button is pressed and we can jump, jump.
		velocity.y = jump_velocity
		jumps += 1
	
	# Tell godot to actually move the player with our velocity vector
	velocity = move_and_slide(velocity, Vector3.UP)
	
	# Dampen the velocity depending on ground/air factors, so that we don't accelerate out of control.
	if is_on_floor():
		velocity.x *= movement_dampening_floor
		velocity.z *= movement_dampening_floor
	else:
		velocity.x *= movement_dampening_air
		velocity.z *= movement_dampening_air
