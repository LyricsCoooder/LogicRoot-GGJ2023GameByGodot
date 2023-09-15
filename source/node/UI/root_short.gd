extends Sprite

var mouse_in = false

signal select_root_short
signal not_select_root_short

func _ready():
	pass 

func _process(delta):
	if Input.is_action_just_pressed("mouse_left") and mouse_in:
		if texture.pause:
			texture.pause = not texture.pause
			
			get_parent().get_node("root_len").texture.pause = true
			get_parent().get_node("root_len").get_node("text").texture.pause = true
			get_parent().get_node("root_len").emit_signal("not_select_root_len")
			
			get_parent().get_node("root").texture.pause = true
			get_parent().get_node("root").get_node("text").texture.pause = true
			get_parent().get_node("root").emit_signal("not_select_root")
			
			get_parent().get_node("root_or").texture.pause = true
			get_parent().get_node("root_or").get_node("text").texture.pause = true
			get_parent().get_node("root_or").emit_signal("not_select_root_or")
			
			$text.texture.pause = false
			emit_signal("select_root_short")
		else:
			texture.pause = not texture.pause
			$text.texture.pause = true
			get_parent().get_node("selected").visible = false
			emit_signal("not_select_root_short")
	pass


func _on_Area2D_mouse_entered():
	mouse_in = true
	pass

func _on_Area2D_mouse_exited():
	mouse_in = false
	pass 


