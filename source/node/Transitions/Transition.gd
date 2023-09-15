extends Node2D

export var string = ""
export var string2 = ""

func _ready():
	visible = true
	$Label.text = string
	$Label2.text = string2
	$AnimationPlayer.play("transition_animator")
	pass 
