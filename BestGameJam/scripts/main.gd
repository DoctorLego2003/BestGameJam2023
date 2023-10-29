extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	$themeSong.play();


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if self.get_meta("Lives") <= 0:
		get_tree().change_scene_to_file("res://scenes/other scenes/end_screen.tscn")
	if self.get_meta("TowerIsClicked"):
		#show UI layer
		pass
	else:
		#don't show UI layer
		pass
	
