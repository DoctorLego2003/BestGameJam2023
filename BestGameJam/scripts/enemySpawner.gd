extends Node

@export var minion : PackedScene
@export var cooldownWave : int
@export var intervalSpawn : float
@export var amountOfEnemies : int

var timer : float
var path
var amountSpawned = 0
var inWave = false

# Called when the node enters the scene tree for the first time.
func _ready():
	path = get_node("path")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if inWave:
		if (amountSpawned < amountOfEnemies):
			timer += delta
			if(timer >= intervalSpawn):
				spawn()	
				amountSpawned += 1
				timer = 0
		else:
			amountSpawned = 0
			inWave = false
	else:
		timer += delta
		if(timer >= cooldownWave):
			timer = 0
			inWave = true

func spawn():
	var spawnedEnemy = minion.instantiate()
	path.add_child(spawnedEnemy)
