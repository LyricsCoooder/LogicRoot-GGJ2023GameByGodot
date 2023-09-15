extends Label

func _ready():
	get_parent().get_node("level_base").connect("root_short_position",self,"root_short_position")
	pass


var state = true
signal fin

func _process(delta):
	if get_parent().get_node("level_base").get_node("UI").get_node("root_short").texture.pause == false and state:
		visible = true
	pass

func root_short_position():
	visible = false
	state = false
	emit_signal("fin")
	pass
