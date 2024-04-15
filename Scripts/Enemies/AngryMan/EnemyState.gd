extends Node
class_name EnemyState

@export var speed : float
@export var stateManager : EnemyStateMachine

var playerPos : Vector3
var player : Player

func exit() -> void:
	pass

func state_process(delta) -> void:
	pass
