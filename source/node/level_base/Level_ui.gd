extends Sprite


export var path = ""
export var open = false
export var num = 0
var mouse_in = false

func _ready():
	$arrow.visible = open
	if open == false:
		$AnimatedSprite.frame = 0
	else:
		$AnimatedSprite.frame = num
	pass

func _process(delta):
	if open:
		$arrow.visible = open
		$AnimatedSprite.frame = num
		if Input.is_action_just_pressed("mouse_left") and mouse_in:
			Select.play()
			SceneChange.change_scense(path)
	pass


func _on_Area2D_mouse_entered():
	mouse_in = true
	pass


func _on_Area2D_mouse_exited():
	mouse_in = false
	pass # Replace with function body.
