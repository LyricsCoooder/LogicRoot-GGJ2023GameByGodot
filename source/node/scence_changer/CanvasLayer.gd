extends CanvasLayer

onready var rect = $ColorRect
onready var animation = $AnimationPlayer

func change_scense(path):
	rect.show()
	animation.play("scence_changer")
	yield(animation,"animation_finished")
	get_tree().change_scene(path)
	animation.play_backwards("scence_changer")
	yield(animation,"animation_finished")
	rect.hide()
	pass
