extends Sprite

func _ready():
	pass

var mouse_in = false

func _process(delta):
	if Input.is_action_just_pressed("mouse_left") and mouse_in:
		Select.play()
		get_tree().quit()
		print("dsads")
	pass


func _on_Area2D_mouse_entered():
	texture.pause = false
	mouse_in = true
	$arrow.visible = true
	pass


func _on_Area2D_mouse_exited():
	texture.pause = true
	mouse_in = false
	$arrow.visible = false
	pass # Replace with function body.
