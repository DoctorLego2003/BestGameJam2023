extends PathFollow3D

@export var health : int = 2
@export var speed : int = 2
@export var damage : int = 1

func _process(delta):
	move(delta)
	if (self.health <= 0):
		queue_free()
	
func move(delta):
	self.progress += delta * speed



func _on_area_3d_area_entered(area):
	
	if (area.is_in_group("projectile")):
		health -= 1
	
	if (area.name == "CastleArea"):
		var main = get_node("/root/main")
		var newLives = main.get_meta('Lives') - damage
		main.set_meta("Lives", newLives)
		get_parent().remove_child(self)
