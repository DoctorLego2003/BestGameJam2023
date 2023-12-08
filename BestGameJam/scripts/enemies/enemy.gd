extends PathFollow3D

@export var health : int 
@export var speed : int 
@export var damage : int 
@export var score : int

func _process(delta):
	move(delta)
	if (self.health <= 0):
		var main = get_node("/root/main")
		main.set_meta("Score", main.get_meta("Score") + score)
		get_parent().get_parent().totalDead += 1
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
		self.queue_free()
