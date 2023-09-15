extends Sprite
	
signal can_produce(node_position)

signal use_chenk
signal node_change

var is_run = false
var node_occupy = [0,0]
var nodes = []



func _ready():
	connect("can_produce",self,"can_produce")
	connect("use_chenk",self,"chenk")
	pass

func chenk():
	if is_run:
		if nodes[0].state:
			nodes[1].state = true
		else:
			nodes[1].state = false
			
		emit_signal("node_change")
		pass
		
		

func _process(delta):
	if node_occupy[0]==1:
		emit_signal("can_produce",1)
		pass
	if node_occupy[1]==1:
		emit_signal("can_produce",0)
		pass
	pass



func can_produce(node_position):
	nodes[0].connect("is_change",self,"chenk")
	
	nodes.append(preload("res://node/01node/node.tscn").instance())
	if node_position == 0:
		var temp_position = $Area2D/CollisionShape2D.position
		nodes[1].position.x = int(temp_position.x/64)*64-32
		nodes[1].position.y = int(temp_position.y/64)*64-32
		
	if node_position == 1:
		var temp_position = $Area2D2/CollisionShape2D.position
		nodes[1].position.x = int(temp_position.x/64)*64-32
		nodes[1].position.y = int(temp_position.y/64)*64-32
	
	nodes[1].get_node("Particles2D").hide()		
	
	nodes[1].parent.append($".")
	

	add_child(nodes[1])
	disconnect("can_produce",self,"can_produce")
	is_run = true
	
	emit_signal("use_chenk")
	pass
	
func _on_Area2D2_area_entered(area):
	node_occupy[1]=1
	nodes.append(area.get_parent())
	print("1")
	pass # Replace with function body.


func _on_Area2D_area_entered(area):
	node_occupy[0]=1
	nodes.append(area.get_parent())
	print("0")
	pass # Replace with function body.
