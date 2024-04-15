extends State
class_name ClimbState

@export var footCast : RayCast3D
var loseAmount : float

func stateInput(event : InputEvent):
	if event.is_action_pressed("jump"):
		exit()
		
func exit():
	if player.is_on_floor():
		nextState = groundState
	else:
		nextState = airState
	player.grav = 12
	player.speed = 10

func state_process(delta):
	staminaBar.value -= (loseAmount * staminaMulti)
	player.speed = 5
	player.grav = 0
	if not footCast.is_colliding():
		exit()
		
	if Input.is_action_pressed("forward"):
		player.velocity.y = 5
		loseAmount = 0.5
	elif Input.is_action_pressed("back"):
		player.velocity.y = -5
		loseAmount = 0.5
	else:
		player.velocity.y = 0
		loseAmount = 0.25
		
	if staminaBar.value == 0:
		exit()
	
	if player.is_on_floor():
		exit()
	
	
