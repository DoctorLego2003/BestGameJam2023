extends Node

@export var minion : PackedScene
@export var archer : PackedScene
@export var warrior : PackedScene
@export var cooldownWave : int
@export var intervalSpawn : float
var amountOfEnemies : int

var timer : float
var path
var amountSpawned = 0
var inWave = true
var allEnemyTypes = [minion, archer, warrior]

var waveCount = 0
var enemyType
@export var waves =  [[0,3,0],[1,2,0],[2,3,0],[3,3,0],[3,4,1],[4,4,2],[6,4,1],[8,4,2],[6,6,4]]  

# Called when the node enters the scene tree for the first time.
func _ready():
	path = self.get_node("path")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (waveCount <= waves.size() -1):
		if inWave:
			amountOfEnemies = sum_array(waves[waveCount])
			if (amountSpawned < amountOfEnemies):
				timer += delta
				if(timer >= intervalSpawn):
					if (waves[waveCount][0] > 0):
						spawnArcher()
						amountSpawned += 1
						waves[waveCount][0] -= 1
					elif (waves[waveCount][1] > 0):
						spawnMinion()	
						amountSpawned += 1
						waves[waveCount][1] -= 1
					elif (waves[waveCount][2] > 0):
						spawnWarrior()
						amountSpawned += 1
						waves[waveCount][2] -= 1
					timer = 0
			else:
				amountSpawned = 0
				inWave = false
		else:
			timer += delta
			if(timer >= cooldownWave):
				timer = 0
				waveCount += 1
				inWave = true

static func sum_array(array):
	var sum = 0.0
	for element in array:
		sum += element
	return sum

func spawnArcher():
	var newarcher = warrior.instantiate()
	path.add_child(newarcher)

func spawnMinion():
	var newminion = minion.instantiate()
	path.add_child(newminion)
	
func spawnWarrior():
	var newwarrior = warrior.instantiate()
	path.add_child(newwarrior)
	
