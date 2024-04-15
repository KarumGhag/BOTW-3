extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = 12


func _physics_process(delta):
	if not is_on_floor():
		velocity.y -= gravity * delta

	move_and_slide()
