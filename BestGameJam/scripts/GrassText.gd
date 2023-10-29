extends TextEdit

var newTower = preload("res://scenes/tiles/tower.tscn")

func _on_area_3d_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_MASK_LEFT and event.pressed:
			visible = true
			var main = get_node("/root/main")
			if (main.get_meta("TowerIsClicked")):
				switch(main.get_meta("ClickedTowerPath"), get_parent())

func _on_area_3d_mouse_exited():
	visible = false

func switch(towerPath, grass):
	var main = get_node("/root/main")
	var tower = get_node(towerPath)
	print(tower)
	print(grass)
	var t = newTower.instantiate()
	tower.replace_by(grass)
	grass.replace_by(t)
	#to.remove_from_group("gameboard")
	main.set_meta("TowerIsClicked", false)
	main.set_meta("ClickedTowerPos", "")

