extends Node

@export var minion : PackedScene
@export var cooldownWave : int
@export var intervalSpawn : float
@export var amountOfEnemies : int

var path


# Called when the node enters the scene tree for the first time.
func _ready():
	path = get_node("path")
	spawn()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func spawn():
	var spawnedEnemy = minion.instantiate()
	path.add_child(spawnedEnemy)
