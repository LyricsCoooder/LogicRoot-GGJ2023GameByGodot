extends Node2D

func _process(delta):
	if $level_base.is_win:
		$ColorRect.visible = true
	pass
