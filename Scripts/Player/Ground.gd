extends State
class_name GroundState

var jumpPower : float = 6

@export var glider : Node3D

func stateInput(event):
	glider.hide()
	if event.is_action_pressed("jump"):
		if not climbCast.is_colliding():
			jump()
		elif canUseStamina:
			player.velocity.y = 5
			nextState = climbState
	if event.is_action_pressed("sprint") and canUseStamina:
		player.speed = 20
		nextState = sprintingState
		
func jump():
	player.velocity.y = jumpPower
	nextState = airState

func state_process(delta):
	if not player.is_on_floor():
		nextState = airState
		
	if staminaBar.value == 0:
		canUseStamina = false
	if staminaBar.value != 100:
		staminaBar.value += 0.5
	else:
		canUseStamina = true	
	if canUseStamina:
		player.speed = 10

	if Input.is_action_pressed("sprint") and canUseStamina:
		player.speed = 20
		nextState = sprintingState
