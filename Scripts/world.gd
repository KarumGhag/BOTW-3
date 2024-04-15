extends Node3D

var angryMan = preload("res://Scenes/angry_man.tscn")

@export var spawnLoc : Node3D


func _on_tree_entered():
	var angryManInst = angryMan.instantiate()
	add_child(angryManInst)
	angryManInst.position = spawnLoc.get_global_position()
	print(angryManInst.position)
