extends Sprite


var mouse_in = false

signal select_root_len
signal not_select_root_len

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("mouse_left") and mouse_in:
		if texture.pause:
			texture.pause = not texture.pause
			get_parent().get_node("root").texture.pause = true
			get_parent().get_node("root").get_node("text").texture.pause = true
			get_parent().get_node("root").emit_signal("not_select_root")
			
			get_parent().get_node("root_or").texture.pause = true
			get_parent().get_node("root_or").get_node("text").texture.pause = true
			get_parent().get_node("root_or").emit_signal("not_select_root_or")
			
			get_parent().get_node("root_short").texture.pause = true
			get_parent().get_node("root_short").get_node("text").texture.pause = true
			get_parent().get_node("root_short").emit_signal("not_select_root_short")
			
			$text.texture.pause = false
			emit_signal("select_root_len")
			
		else:
			texture.pause = not texture.pause
			$text.texture.pause = true
			get_parent().get_node("selected").visible = false
			emit_signal("not_select_root_len")
	pass


func _on_Area2D_mouse_entered():
	mouse_in = true
	pass # Replace with function body.

func _on_Area2D_mouse_exited():
	mouse_in = false
	pass # Replace with function body.
