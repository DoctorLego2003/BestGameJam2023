extends Node

@export var arrow : PackedScene
var shootingRange = 2

var currentTargets = []
var currentTarget

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# ==== SHOOTING PART ======= #
func _on_aggro_area_entered(area):
	if area.is_in_group("enemy"):
		currentTarget.append(area.get_parent())
		print("enemy entered range!")
	
func _on_aggro_area_exited(area):
	if area.is_in_group("enemy"):
		currentTarget.erase(area.get_parent())
		print("enemy exited range!")

func shootTarget():
	var arrowInstance = arrow.instantiate()
	add_child(arrowInstance)

# ========================== #

# ==== PLACING PART ======= #


func _get_drag_data(at_position):
	return at_position

func _can_drop_data(_pos, data):
	return false

func _drop_data(_pos, data):
	pass
	
# ========================== #

func _process(delta):
	pass 
