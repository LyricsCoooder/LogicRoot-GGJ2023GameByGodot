extends Node2D

onready var node = get_parent().get_node("node")

onready var fin0 = $Target1/fin
onready var fin1 = $Target2/fin


func _process(delta):

	if fin_chenk():
		get_parent().get_node("level_base").is_win = true
	else:
		get_parent().get_node("level_base").is_win = false
	pass
	
func fin_chenk():
	if not get_parent().get_node("end").node.empty():
		if node.state == get_parent().get_node("end").node[0].state:
			if node.state == true:
				fin0.visible = true
			if node.state == false:
				fin1.visible = true
	if fin0.visible and fin1.visible:
		return true
	else:
		return false
	pass
