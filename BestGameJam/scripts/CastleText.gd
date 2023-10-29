extends TextEdit

func _on_area_3d_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_MASK_LEFT and event.pressed:
			visible = true
			var main = get_node("/root/main")
			main.set_meta("TowerIsClicked", false)

func _on_area_3d_mouse_exited():
	visible = false
