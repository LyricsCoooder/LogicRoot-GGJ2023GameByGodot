extends Node


func _ready():
	pass


func _process(delta):
	
	if not get_parent().node.empty():
		if get_parent().node[0].state:
			get_node("AE2").modulate=Color.black
		else:
			get_node("AE2").modulate=Color.white
	pass
