extends Sprite


func _ready():
	texture.pause = false
	pass

export var agin = ""
var mouse_in = false

func _process(delta):
	if Input.is_action_just_pressed("mouse_left") and mouse_in:
		Select.play()
		
		SceneChange.change_scense(agin)
		#get_tree().change_scene("res://node/select_menu/select_menu.tscn")
	pass


func _on_Area2D_mouse_entered():
	texture.pause = false
	#$arrow.visible = true
	mouse_in = true
	pass


func _on_Area2D_mouse_exited():
	texture.pause = true
	#$arrow.visible = false
	mouse_in = false
	pass # Replace with function body.
