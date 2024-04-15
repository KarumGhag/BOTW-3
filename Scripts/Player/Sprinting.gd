extends State
class_name SprintingState

var jumpPower : float = 6

func state_process(delta):
	player.speed = 20
	if player.moving:
		staminaBar.value -= (0.8 * staminaMulti)
		
	if staminaBar.value == 0:
		exit()
	

	
func stateInput(event):
	if event.is_action_released("sprint"):
		exit()
	if event.is_action_pressed("jump"):
		if not climbCast.is_colliding():
			jump()
		elif canUseStamina:
			player.velocity.y = 15
			nextState = climbState
	if event.is_action_pressed("sprint") and canUseStamina:
		player.speed = 20
		nextState = sprintingState

func jump():
	player.velocity.y = jumpPower
	nextState = airState

func exit():
	player.speed = 15
	nextState = groundState

