extends Label

var hid = false
func _ready():
	get_parent().get_node("level_base").connect("root_or_position",self,"posi")
	pass # Replace with function body.



func _process(delta):
	if hid:
		visible = false
	
		hid = true
	pass

func posi():
	visible = true
	pass
