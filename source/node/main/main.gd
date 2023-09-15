extends Node2D

export var tool_num = 0
export var agin = ""
export var is_win = false
export var level = 0

var place_len = false
var place = false
var place_or = false
var place_short = false
var seleted = false

func _ready():
	$agin.agin = agin
	
	$mouse_root_len.connect("cant_place",self,"cant_place_len")
	$mouse_root_len.connect("can_place",self,"can_place_len")
	$mouse_root.connect("cant_place",self,"cant_place")
	$mouse_root.connect("can_place",self,"can_place")
	$mouse_root_or.connect("cant_place",self,"cant_place_or")
	$mouse_root_or.connect("can_place",self,"can_place_or")
	$mouse_root_short.connect("cant_place",self,"cant_place_short")
	$mouse_root_short.connect("can_place",self,"can_place_short")
	
	if tool_num ==0:
		$UI.visible =false
	if tool_num ==1:
		$UI/root_len.visible =false
		$UI/root.visible =false
		$UI/root_or.visible =false
	if tool_num ==2:
		$UI/root.visible =false
		$UI/root_or.visible =false
	if tool_num ==3:
		$UI/root_or.visible =false
	if tool_num ==4:
		pass
	
	pass



func cant_place_short():
	place_short = false
	pass

func can_place_short():
	place_short = true
	pass
	
func cant_place_or():
	place_or = false
	pass

func can_place_or():
	place_or = true
	pass
	
func cant_place_len():
	place_len = false
	pass

func can_place_len():
	place_len = true
	pass
	
func cant_place():
	place = false
	pass

func can_place():
	place = true
	pass

signal root_select
signal root_position
signal root_len_select
signal root_len_position
signal root_or_select
signal root_or_position
signal root_short_select
signal root_short_position

func _process(delta):
	if is_win:
		$next.visible = true
	elif $next.visible == true:
		$next.visible = false
	
	if	$UI/root_or.texture.pause == false:
		emit_signal("root_or_select")
		if seleted:
			Input.set_mouse_mode(0)
			$mouse_root_len.visible = false
			$mouse_root.visible = false
			$mouse_root_or.visible = false
			$mouse_root_short.visible = false
			
		else:
			Input.set_mouse_mode(1) 
			$mouse_root_len.visible = false
			$mouse_root.visible = false
			$mouse_root_or.visible = true
			$mouse_root_short.visible = false
		
		var temp_position = get_viewport().get_mouse_position()
		if $mouse_root_or.rotation_degrees == 0 or $mouse_root_or.rotation_degrees == 360:
			$mouse_root_or.position.x = int(temp_position.x/64)*64-64
			$mouse_root_or.position.y = int(temp_position.y/64)*64
		if $mouse_root_or.rotation_degrees == 90:
			$mouse_root_or.position.x = int(temp_position.x/64)*64+64
			$mouse_root_or.position.y = int(temp_position.y/64)*64-64
		if $mouse_root_or.rotation_degrees == 180:
			$mouse_root_or.position.x = int(temp_position.x/64)*64+128
			$mouse_root_or.position.y = int(temp_position.y/64)*64+64
		if $mouse_root_or.rotation_degrees == 270:
			$mouse_root_or.position.x = int(temp_position.x/64)*64
			$mouse_root_or.position.y = int(temp_position.y/64)*64+128
		
		if place_or == true:
			if Input.is_action_just_pressed("mouse_left") and not $UI.mouse_in:
				emit_signal("root_or_position")

				Select.play()
				var instance = preload("res://node/root/root_or.tscn").instance()
				add_child(instance)	
				instance.position = $mouse_root_or.position
				instance.rotation_degrees = $mouse_root_or.rotation_degrees
				
				$UI/root_or.texture.pause = not $UI/root_or.texture.pause
				$UI/root_or/text.texture.pause = true
				$UI/selected.visible = false
				$UI/root_or.emit_signal("not_select_root_or")
				Input.set_mouse_mode(0) 
				
		if Input.is_action_just_pressed("R"):
			Select.play()
			if $mouse_root_or.rotation_degrees < 360:
				$mouse_root_or.rotation_degrees += 90
			else:
				$mouse_root_or.rotation_degrees = 90

	if	$UI/root.texture.pause == false:
		emit_signal("root_select")
		if seleted:
			Input.set_mouse_mode(0)
			$mouse_root_len.visible = false
			$mouse_root.visible = false
			$mouse_root_or.visible = false
			$mouse_root_short.visible = false

		else:
			Input.set_mouse_mode(1) 
			$mouse_root_len.visible = false
			$mouse_root_or.visible = false
			$mouse_root.visible = true
			$mouse_root_short.visible = false

		
		
		var temp_position = get_viewport().get_mouse_position()
		$mouse_root.position.x = int(temp_position.x/64)*64+32
		$mouse_root.position.y = int(temp_position.y/64)*64+32
		
		if place == true:
			if Input.is_action_just_pressed("mouse_left") and not $UI.mouse_in:
				emit_signal("root_position")
				Select.play()
				var instance = preload("res://node/root/root.tscn").instance()
				add_child(instance)	
				instance.position = $mouse_root.position
				instance.rotation_degrees = $mouse_root.rotation_degrees
				
				$UI/root.texture.pause = not $UI/root.texture.pause
				$UI/root/text.texture.pause = true
				$UI/selected.visible = false
				$UI/root.emit_signal("not_select_root")
				Input.set_mouse_mode(0) 

		if Input.is_action_just_pressed("R"):
			Select.play()
			$mouse_root.rotation_degrees += 90

	if	$UI/root_len.texture.pause == false:
		emit_signal("root_len_select")
		if seleted:
			Input.set_mouse_mode(0)
			$mouse_root_len.visible = false
			$mouse_root.visible = false
			$mouse_root_or.visible = false
			$mouse_root_short.visible = false
		else:	
			Input.set_mouse_mode(1) 
			$mouse_root.visible = false
			$mouse_root_or.visible = false
			$mouse_root_len.visible = true
			$mouse_root_short.visible = false

		
		var temp_position = get_viewport().get_mouse_position()
		$mouse_root_len.position.x = int(temp_position.x/64)*64+32
		$mouse_root_len.position.y = int(temp_position.y/64)*64+32
		
		if place_len==true:	
			if Input.is_action_just_pressed("mouse_left") and not $UI.mouse_in:
				emit_signal("root_len_position")
				Select.play()
				var instance = preload("res://node/root/root_len.tscn").instance()
				add_child(instance)	
				instance.position = $mouse_root_len.position
				instance.rotation_degrees = $mouse_root_len.rotation_degrees
				
				$UI/root_len.texture.pause = not $UI/root_len.texture.pause
				$UI/root_len/text.texture.pause = true
				$UI/selected.visible = false
				$UI/root_len.emit_signal("not_select_root_len")
				Input.set_mouse_mode(0) 
		if Input.is_action_just_pressed("R"):
			Select.play()
			$mouse_root_len.rotation_degrees += 90

	if	$UI/root_short.texture.pause == false:
		emit_signal("root_short_select")
		if seleted:
			Input.set_mouse_mode(0)
			$mouse_root_len.visible = false
			$mouse_root.visible = false
			$mouse_root_or.visible = false
			$mouse_root_short.visible = false

		else:
			Input.set_mouse_mode(1) 
			$mouse_root.visible = false
			$mouse_root_or.visible = false
			$mouse_root_len.visible = false
			$mouse_root_short.visible = true
		

		
		var temp_position = get_viewport().get_mouse_position()
		if $mouse_root_short.rotation_degrees == 0:
			$mouse_root_short.position.x = int(temp_position.x/64)*64+32+32
			$mouse_root_short.position.y = int(temp_position.y/64)*64+32
		else:
			$mouse_root_short.position.x = int(temp_position.x/64)*64+32
			$mouse_root_short.position.y = int(temp_position.y/64)*64+32+32
		
		if place_short==true:
			if Input.is_action_just_pressed("mouse_left") and not $UI.mouse_in:
				emit_signal("root_short_position")
				Select.play()
				var instance = preload("res://node/root/root_short.tscn").instance()
				add_child(instance)	
				instance.position = $mouse_root_short.position
				instance.rotation_degrees = $mouse_root_short.rotation_degrees
				
				$UI/root_short.texture.pause = not $UI/root_short.texture.pause
				$UI/root_short/text.texture.pause = true
				$UI/selected.visible = false
				$UI/root_short.emit_signal("not_select_root")
				Input.set_mouse_mode(0) 
				
		if Input.is_action_just_pressed("R"):
			Select.play()
			if $mouse_root_short.rotation_degrees <90:
				$mouse_root_short.rotation_degrees += 90
			else:
				$mouse_root_short.rotation_degrees = 0


func _on_not_prevent_mouse_entered():
	seleted = true
	pass # Replace with function body.


func _on_not_prevent_mouse_exited():
	seleted = false
	pass # Replace with function body.
