extends LineEdit


# Called when the node enters the scene tree for the first time.
func _ready():
	var main = get_node("/root/main")
	main.set_meta("Score", 0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var main = get_node("/root/main")
	self.text = str(main.get_meta("Score"))
