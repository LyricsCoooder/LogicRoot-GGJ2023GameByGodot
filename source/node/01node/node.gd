extends Node2D

export var state = false
export var can_mouse = false
export var num = 0


signal is_change
var mouse_in = false
var parent =[]

func _ready():
	if not parent.empty():
		parent[0].connect("node_change",self,"change")
	if num == 0:
		$AnimatedSprite.hide()
	if num == 1:
		$AnimatedSprite.frame = 0
	if num == 2:
		$AnimatedSprite.frame = 1
	if num == 3:
		$AnimatedSprite.frame = 2
	if num == 4:
		$AnimatedSprite.frame = 3
	if num == 5:
		$AnimatedSprite.frame = 4
	pass

func change():
	state = !state
	emit_signal("is_change")
	
func _process(delta):
	if can_mouse:
		$Timer.set_paused(true)
		if Input.is_action_just_pressed("mouse_left") and mouse_in:
			Select.play()
			state = !state
			emit_signal("is_change")
	if state:
		$AnimatedSprite.modulate=Color( 0, 0, 0, 160 )
		#$A_E.modulate=Color( 0, 0, 0, 160 )
		$Particles2D.visible = true
		$"1node".visible = false
	else:
		$AnimatedSprite.modulate=Color( 1, 1, 1, 160 )
		#$A_E.modulate=Color( 1, 1, 1, 160 )
		$Particles2D.visible = false
		$"1node".visible = true
	pass


func _on_Timer_timeout():
	state = not state
	pass # Replace with function body.


func _on_Area2D_mouse_entered():
	mouse_in = true
	pass # Replace with function body.


func _on_Area2D_mouse_exited():
	mouse_in = false
	pass # Replace with function body.
