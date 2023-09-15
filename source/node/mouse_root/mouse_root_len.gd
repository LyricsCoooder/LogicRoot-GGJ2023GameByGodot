extends Sprite

var left_node = false
var right_node = false

signal cant_place
signal can_place

func _process(delta):

	if !left_node and !right_node:
		emit_signal("cant_place")
	elif left_node and right_node:
		emit_signal("cant_place")
	else:
		emit_signal("can_place")
	pass


func _on_Area2D_area_entered(area):
	left_node = true
	pass # Replace with function body.


func _on_Area2D2_area_entered(area):
	right_node = true
	pass # Replace with function body.


func _on_Area2D_area_exited(area):
	left_node = false
	pass # Replace with function body.


func _on_Area2D2_area_exited(area):
	right_node = false
	pass # Replace with function body.
