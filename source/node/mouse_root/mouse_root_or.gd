extends Sprite

var left_node = false
var mid_node = false
var right_node = false

signal cant_place
signal can_place

func _process(delta):
	if !left_node and right_node and mid_node:
		emit_signal("can_place")
	elif left_node and !right_node and mid_node:
		emit_signal("can_place")
	elif left_node and right_node and !mid_node:
		emit_signal("can_place")
	else:
		emit_signal("cant_place")
	pass

func _on_Area2D3_area_entered(area):
	left_node = true
	pass # Replace with function body.


func _on_Area2D3_area_exited(area):
	left_node = false
	pass # Replace with function body.


func _on_Area2D2_area_entered(area):
	mid_node = true
	pass # Replace with function body.


func _on_Area2D2_area_exited(area):
	mid_node = false
	pass # Replace with function body.


func _on_Area2D_area_entered(area):
	right_node = true
	pass # Replace with function body.


func _on_Area2D_area_exited(area):
	right_node = false
	pass # Replace with function body.

