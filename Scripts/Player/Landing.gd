extends State
class_name GlidingState

@export var gliderMesh : Node3D

func state_process(delta):
	gliderMesh.show()
	player.grav = 3
	if player.is_on_floor():
		exit()
	staminaBar.value -= (0.9 * staminaMulti)
	if staminaBar.value == 0:
		exit()
	
func stateInput(event : InputEvent):
	if event.is_action_pressed("jump"):
		exit()


func exit():
	gliderMesh.hide()
	player.grav = 12
	if not player.is_on_floor():
		nextState = airState
	else:
		gliderMesh.hide()
		nextState = groundState
