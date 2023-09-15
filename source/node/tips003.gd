extends Label

var hid = false
func _ready():
	get_parent().get_node("level_base").connect("root_position",self,"posi")
	pass # Replace with function body.



func _process(delta):
	if hid:
		visible = false
	if get_parent().get_node("node").state and get_parent().get_node("node2").state:
		hid = true
	pass

func posi():
	visible = true
	pass
