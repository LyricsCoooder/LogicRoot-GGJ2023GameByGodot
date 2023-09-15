extends Node2D

onready var node = get_parent().get_node("node")
onready var node1 = get_parent().get_node("node").get_node("node2")
onready var node2 = get_parent().get_node("node").get_node("node3")

onready var fin0 = $Target1/fin
onready var fin1 = $Target2/fin
onready var fin2 = $Target3/fin

func _process(delta):

	if fin_chenk():
		get_parent().get_node("level_base").is_win = true
	else:
		get_parent().get_node("level_base").is_win = false
	pass
	
func fin_chenk():
	fin0.visible = node.state
	fin1.visible = node1.state
	fin2.visible = node2.state
	if node.state and node1.state and node2.state:
		return true
	else:
		return false
	pass

