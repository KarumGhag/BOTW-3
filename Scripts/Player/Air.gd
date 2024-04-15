extends State
class_name AirState

func onEnter():
	canUseStamina = groundState.canUseStamina
	
func state_process(delta):
	if player.is_on_floor():
		nextState = groundState
		
	if staminaBar.value == 0:
		canUseStamina = false
	if staminaBar.value == 100:
		canUseStamina = true
		


func stateInput(event : InputEvent):
	if event.is_action_pressed("jump") and canUseStamina and climbCast.is_colliding():
		nextState = climbState
	elif event.is_action_pressed("jump") and canUseStamina:
		player.velocity.y /= 2
		nextState = glidingState

		
