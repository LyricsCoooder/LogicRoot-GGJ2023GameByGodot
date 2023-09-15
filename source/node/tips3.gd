extends Label


func _ready():
	get_parent().get_node("tips2").connect("fin",self,"fin")
	pass



func _process(delta):
	if get_parent().get_node("level_base").is_win:
		visible = false
	pass

func fin():
	visible = true
	pass
