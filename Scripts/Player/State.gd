extends Node
class_name State

@export var canMove : bool = true
var player : CharacterBody3D
var nextState : State

#States
@export var groundState : GroundState
@export var airState : AirState
@export var glidingState : GlidingState
@export var sprintingState : SprintingState

#Stamina system
@export var staminaBar : TextureProgressBar
@export var staminaLoseBar : TextureProgressBar
@export var staminaMulti : float = 1
var canUseStamina : bool = true

#Climing
@export var climbState : ClimbState
@export var climbCast : RayCast3D

func stateInput(event):
	pass

func onExit():
	pass

func onEnter():
	pass
	
func state_process(delta):
	pass
	
