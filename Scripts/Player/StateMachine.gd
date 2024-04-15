extends Node3D
class_name StateMachine

var states : Array[State]

@export var currentState : State

@export var player : Player 
@export var groundState : GroundState
@export var airState : AirState
@export var climbState : ClimbState

func _ready():
	for children in get_children():
		if children is State:
			states.append(children)
			children.player = player

func checkCanMove():
	return currentState.canMove

func _physics_process(delta):
	currentState.staminaLoseBar.value = currentState.staminaBar.value + 1

	if currentState == groundState:
		currentState.staminaLoseBar.tint_progress = Color(0, 0, 0, 255)
	elif currentState == airState:
		pass
	else:
		currentState.staminaLoseBar.tint_progress = Color(145, 0, 0, 255)

	if currentState.nextState != null:
		switchState(currentState.nextState)
	currentState.state_process(delta)
	if currentState.staminaBar.value == 0:
		currentState.staminaBar.tint_progress = Color(255, 0, 0, 255)
	if currentState.staminaBar.value == 100:
		currentState.staminaBar.tint_progress = Color(0, 255, 0, 255)
		
	if currentState.canUseStamina == false:
		player.speed = 5
	

func _input(event : InputEvent):
	currentState.stateInput(event)


func switchState(newState : State):
	if currentState != null:
		currentState.onExit() 
		currentState.nextState = null
		
	currentState = newState
	currentState.onEnter()
	
	
	
