extends Control

@onready var anim_player = $AnimationPlayer

func _process(delta):
	var mousePos = (get_viewport().get_mouse_position().x - 777) * 5
	var frame = round(mousePos / get_viewport_rect().size.x * 9)
	anim_player.current_animation = "play"
	anim_player.seek(frame / 10)
	
