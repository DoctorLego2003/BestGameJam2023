extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if self.get_meta("Lives") <= 0:
		print('dead')
	if self.get_meta("TowerIsClicked"):
		print('Tower Clicked')
		print(self.get_meta("ClickedTowerPath"))
