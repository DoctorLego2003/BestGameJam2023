extends Node

@export var minion : PackedScene
@export var archer : PackedScene
@export var warrior : PackedScene
@export var cooldownWave : int = 10
@export var intervalSpawn : float = 0.5
var amountOfEnemies : int

var timer : float
var path
var amountSpawned = 0
var inWave = true
var allEnemyTypes = [archer, minion, warrior]

var waveCount = 0
var NewWave = true
var enemyType
@export var waves =  [[0,3,0],[1,2,0],[2,3,0],[3,3,0],[3,4,1],[4,4,2],[6,4,1],[8,4,2],[6,6,4]]  

var allCount
var totalDead = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	path = self.get_node("path")
	allCount = sum_array(waves)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (waveCount <= waves.size() -1):
		if inWave:
			if (NewWave):
				NewWave = false
			timer += delta
			if(timer >= intervalSpawn):
				$SpawnSound.play()
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
				else:
					amountSpawned = 0
					inWave = false
				timer = 0
		else:
			timer += delta
			if(timer >= cooldownWave):
				timer = 0
				waveCount += 1
				inWave = true
				NewWave = true
			if totalDead >= allCount:
				get_parent().Spawner2Done = true
	elif totalDead >= allCount:
		get_parent().Spawner2Done = true
		totalDead -= 1

static func sum_array(array):
	if array is int:
		return array
	var sum = 0
	for i in array:
		sum += sum_array(i)
	return sum

func spawnArcher():
	path.add_child(archer.instantiate())

func spawnMinion():
	path.add_child(minion.instantiate())
	
func spawnWarrior():
	path.add_child(warrior.instantiate())
