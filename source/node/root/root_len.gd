extends Sprite
	
	
var start_position = -1 #-1代表还没有接入节点
var nodes = []

func _physics_process(delta):
	if start_position != -1:
		nodes[1].state = not nodes[0].state
		print(nodes[1].state)
		pass
	
func _on_Area2D_area_entered(area):
	print(area.get_parent().state)
	if area.get_parent().state and start_position==-1:
		nodes.append(area.get_parent())
		nodes.append(preload("res://node/01node/node.tscn").instance())
		nodes[1].state = false
		var temp_position = $Area2D2/CollisionShape2D.position
		nodes[1].position.x = int(temp_position.x/64)*64-32
		nodes[1].position.y = int(temp_position.y/64)*64-32
		nodes[1].get_node("Timer").autostart = false
		add_child(nodes[1])	
	elif area.get_parent().state == false and start_position==-1:
		nodes.append(area.get_parent())
		nodes.append(preload("res://node/01node/node.tscn").instance())
		nodes[1].state = true
		var temp_position = $Area2D2/CollisionShape2D.position
		nodes[1].position.x = int(temp_position.x/64)*64-32
		nodes[1].position.y = int(temp_position.y/64)*64-32
		nodes[1].get_node("Timer").autostart = false
		add_child(nodes[1])	
		
	start_position = 0	
	pass


func _on_Area2D2_area_entered(area):
	if area.get_parent().state and start_position==-1:
		nodes.append(area.get_parent())
		nodes.append(preload("res://node/01node/node.tscn").instance())
		nodes[1].state = false
		var temp_position = $Area2D/CollisionShape2D.position
		nodes[1].position.x = int(temp_position.x/64)*64-32
		nodes[1].position.y = int(temp_position.y/64)*64-32
		nodes[1].get_node("Timer").autostart = false
		add_child(nodes[1])	
	elif area.get_parent().state == false and start_position==-1:
		nodes.append(area.get_parent())
		nodes.append(preload("res://node/01node/node.tscn").instance())
		nodes[1].state = true
		var temp_position = $Area2D/CollisionShape2D.position
		nodes[1].position.x = int(temp_position.x/64)*64-32
		nodes[1].position.y = int(temp_position.y/64)*64-32
		add_child(nodes[1])	
		nodes[1].get_node("Timer").autostart = false
		
	start_position = 1
	pass
	
