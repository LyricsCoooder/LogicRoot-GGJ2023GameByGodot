extends Node

var level_sum
var level_open = []
func _ready():
	Input.set_mouse_mode(0)
	level_open = get_children()
	print(get_children())
	level_sum = MainContrl.level_sum
	print(level_sum)
	for i in level_sum:
		level_open[i].open = true
		print(i,level_open[i])
	pass 


func _process(delta):
	pass
