extends Label

func _ready():
	get_parent().get_node("level_base").connect("root_position",self,"posi")
	get_parent().get_node("level_base").connect("root_select",self,"sel")
	pass

func posi():
	visible = false
	pass

func sel():
	visible = true
	pass


