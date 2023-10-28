extends PathFollow3D, BoxShape3D

@export var health : int
@export var speed : int
@export var damage : int

func _process(delta):
	move(delta)
	
func move(delta):
	self.progress += delta * speed
	
