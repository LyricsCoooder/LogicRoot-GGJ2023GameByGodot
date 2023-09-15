extends Sprite

export var num = 0

var node = []
signal end_change

func _on_Area2D_area_entered(area):
	
	print(area.get_parent())
	node.append(area.get_parent())
	node[0].connect("is_change",self,"check")
	area.get_parent().get_node("A_E").frame = num
	#area.get_parent().get_node("A_E").visible = true
	pass

func check():
	if not node.empty():
		if node[0].state:
			emit_signal("end_change")
			#$AE2.modulate=Color.black
			get_parent().get_node("AE2").modulate=Color.black
		else:
			emit_signal("end_change")
			#$AE2.modulate=Color.white
			get_parent().get_node("AE2").modulate=Color.white
	pass


