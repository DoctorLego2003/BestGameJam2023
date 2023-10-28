extends PathFollow3D

@export var health : int = 2
@export var speed : int = 2
@export var damage : int = 1

func _process(delta):
	move(delta)
	
func move(delta):
	self.progress += delta * speed
	
