extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	self.set_meta("Lives", 10)
	$themeSong.play();


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if self.get_meta("Lives") <= 0:
		for child in get_children():
			if child.is_in_group("enemy"):
				child.queue_free()
		get_tree().change_scene_to_file("res://scenes/other scenes/end_screen.tscn")
	if self.get_meta("TowerIsClicked"):
		#show UI layer
		$TowerPlaceUI.visible = true
	else:
		#don't show UI layer
		$TowerPlaceUI.visible = false
	
