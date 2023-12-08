extends Node3D

var newGrass = load("res://scenes/tiles/grassTile.tscn")
var newTower = load("res://scenes/tiles/tower.tscn")

func _on_area_3d_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_MASK_LEFT and event.pressed:
			var main = get_node("/root/main")
			if (main.get_meta("TowerIsClicked")):
				switch(main.get_meta("ClickedTowerPath"), main.get_meta("ClickedTowerPos"), self)
	
func switch(towerPath, towerPos, grass):
	var main = get_node("/root/main")
	var tower = get_node(towerPath)
	var g = newGrass.instantiate()
	var t = newTower.instantiate()
	main.get_node("gameboard").add_child(g)
	main.get_node("gameboard").add_child(t)
	
	var grassPos = grass.position
	
	t.position = grassPos
	g.position = towerPos
	
	#to.remove_from_group("gameboard")
	main.set_meta("TowerIsClicked", false)
	main.set_meta("ClickedTowerPath", null)
	
	tower.queue_free()
	self.queue_free()


func _on_area_3d_mouse_entered():
	var main = get_node("/root/main")
	if main.get_meta("TowerIsClicked"):
		$Highlight.visible = true
	else:
		$Highlight.visible = false


func _on_area_3d_mouse_exited():
	$Highlight.visible = false
