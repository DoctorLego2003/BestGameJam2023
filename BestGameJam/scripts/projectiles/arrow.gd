extends Node3D

var speed = 12
var target : Node3D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(target != null):
		var direction = (target.global_position - self.global_position).normalized()
		self.global_position = global_position.move_toward(target.global_position, speed * delta)
		self.look_at(direction)
	else:
		queue_free()
	
	if(global_position.y < 0):
		queue_free()


func _on_area_3d_area_entered(area):
	if(area.is_in_group("enemy")):
		queue_free();
