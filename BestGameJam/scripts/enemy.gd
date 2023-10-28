extends PathFollow3D

@export var health : int = 2
@export var speed : int = 2
@export var damage : int = 1

func _process(delta):
	move(delta)
	
func move(delta):
	self.progress += delta * speed


func _on_area_3d_area_entered(area):
	var main = get_node("/root/main")
	if (area.name == "CastleArea"):
		var newLives = main.get_meta('Lives') - 1
		main.set_meta("Lives", newLives)
		get_parent().remove_child(self)
