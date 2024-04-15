extends Node3D
class_name EnemyStateMachine

var states : Array[State]
@export var currentState : EnemyState

var player : Player
var playerPosition

func _ready() -> void:
	player = get_tree().get_first_node_in_group("player")
	playerPosition = player.position
	
	for children in get_children():
		if children is EnemyState:
			states.append(children)
			children.player = player

func _process(delta) -> void:
	playerPosition = player.position
	
	currentState.playerPos = playerPosition
	currentState.state_process(delta)
