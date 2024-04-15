extends CharacterBody3D
class_name Player

#state machine
@export var stateMachine : StateMachine

#camera
@export var camPivot : Node3D
@export var sens : float = 0.25

#directions
var input_dir : Vector2
var direction : Vector3

#movement
var speed : float = 15
var accel : float = 1
var friction : float = 2
var moving : bool
@export var climbState : ClimbState

#jumping
var grav : float = 12

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event):
	if event is InputEventMouseMotion:
		rotate_y(deg_to_rad(-event.relative.x * sens))
		camPivot.rotate_x(deg_to_rad(-event.relative.y * sens))
		camPivot.rotation.x = clamp(camPivot.rotation.x, deg_to_rad(-60), deg_to_rad(45))
	

func _physics_process(delta):
	
	#quit
	if Input.is_action_just_pressed("leave"):
		get_tree().quit()

	if is_on_floor():
		grav = 12
	if not is_on_floor():
		velocity.y -= grav * delta
		grav *= 1.01

	input_dir = Input.get_vector("left", "right", "forward", "back")
	direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction and stateMachine.checkCanMove():
		moving = true
		velocity.x = move_toward(velocity.x, speed * direction.x, accel)
		velocity.z = move_toward(velocity.z, speed * direction.z, accel)
	else:
		moving = false
		velocity.x = move_toward(velocity.x, 0, friction)
		velocity.z = move_toward(velocity.z, 0, friction)
	
		

	move_and_slide()
	
func getPosition():
	return $".".global_position
