extends Node

@export var arrowScene : PackedScene
var shootingRange = 2

var currentTargets = []
var currentTarget

var shootingCooldown = 1
var shootingTimer : float

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# ==== SHOOTING PART ======= #

func _on_agro_area_entered(area):
	if(area.is_in_group("enemy")):
		currentTargets.append(area.get_parent())


func _on_agro_area_exited(area):
	if(area.is_in_group("enemy")):
		currentTargets.erase(area.get_parent())
	
func findTarget(allTargets):
	return currentTargets[0]

func shoot(target):
	var arrow = arrowScene.instantiate()
	add_child(arrow)
	arrow.position.y = 3
	arrow.target = target
	$arrowShoot.play()

func _process(delta):
	
	shootingTimer += delta
	
	if(not currentTargets.is_empty()):
		currentTarget = findTarget(currentTargets)
	else:
		currentTarget = null
		
	if(currentTarget != null and shootingTimer >= shootingCooldown):
		shoot(currentTarget)
		shootingTimer = 0
		
