extends Node3D

@export var Spawner1Done : bool = false
@export var Spawner2Done : bool = false
@export var Spawner3Done : bool = false
@export var Spawner4Done : bool = false

func _process(delta):
	if Spawner1Done and Spawner2Done and Spawner3Done and Spawner4Done:
		get_tree().change_scene_to_file("res://scenes/other scenes/winning_screen.tscn")
