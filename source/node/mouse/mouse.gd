extends Sprite

func _process(delta):
	var temp_position = get_viewport().get_mouse_position()
	position.x = int(temp_position.x/64)*64
	position.y = int(temp_position.y/64)*64
	pass
