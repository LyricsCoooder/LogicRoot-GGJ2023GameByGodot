extends Node2D

var mouse_in = false

func _ready():
	pass

func _process(delta):
	if Input.is_action_just_pressed("mouse_left") and mouse_in:
		Select.play()
		var temp_position = get_viewport().get_mouse_position()
		
		$selected.position.x = int(temp_position.x/64)*64-128
		$selected.position.y = int(temp_position.y/64)*64
		$selected.visible =	true
	
	pass


func _on_Area2D_mouse_entered():
	mouse_in = true
	pass # Replace with function body.


func _on_Area2D_mouse_exited():
	mouse_in = false
	pass # Replace with function body.
