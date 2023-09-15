extends Node2D

onready var node = get_parent().get_node("node")
onready var node2 = get_parent().get_node("node2")

onready var fin0 = $Target1/fin
onready var fin1 = $Target2/fin
onready var fin2 = $Target3/fin
onready var fin3 = $Target4/fin


var state = true

func _ready():
	get_parent().get_node("level_base").connect("root_len_position",self,"root_posit")
	get_parent().get_node("level_base").connect("root_position",self,"root_posit")
	get_parent().get_node("level_base").connect("root_or_position",self,"root_posit")
	get_parent().get_node("level_base").connect("root_short_position",self,"root_posit")
	
	pass

func root_posit():
	fin0.visible = false
	fin1.visible = false
	fin2.visible = false
	fin3.visible = false
	pass
	


func chenk():
	if fin_chenk():
		get_parent().get_node("level_base").is_win = true
	else:
		get_parent().get_node("level_base").is_win = false
	pass


func _process(delta):
	if state:
		if not get_parent().get_node("end").node.empty():
			get_parent().get_node("end").node[0].connect("is_change",self,"chenk")
			state = false
	else:
		pass
	pass

	
func fin_chenk():
	if not get_parent().get_node("end").node.empty():
		if node.state == true and node2.state == true and get_parent().get_node("end").node[0].state:
			fin0.visible = true
		if node.state == false and node2.state == false and get_parent().get_node("end").node[0].state ==false :
			fin1.visible = true
		if node.state == false and node2.state == true and get_parent().get_node("end").node[0].state:
			fin2.visible = true
		if node.state == true and node2.state == false and get_parent().get_node("end").node[0].state==false:
			fin3.visible = true

			
	if fin0.visible and fin1.visible and fin3.visible and fin2.visible:
		return true
	else:
		return false
	pass
