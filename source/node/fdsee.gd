extends Label

func _ready():
	get_parent().get_node("level_base").connect("root_or_position",self,"posi")
	get_parent().get_node("level_base").connect("root_or_select",self,"sel")
	pass

func posi():
	visible = false
	pass

func sel():
	visible = true
	pass
