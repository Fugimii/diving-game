extends Control

@onready var anim_player = $AnimationPlayer

func _process(delta):
	var mousePos = (get_viewport().get_mouse_position().x - 777) * 5
	var frame = round(mousePos / get_viewport_rect().size.x * 9)
	anim_player.current_animation = "play"
	anim_player.seek(frame / 10)

func _input(event):
	if event.is_action_pressed("click"):
		if anim_player.current_animation_position > 0.4 and anim_player.current_animation_position < 0.5:
			get_tree().change_scene_to_file("res://main.tscn")
		elif anim_player.current_animation_position > 0.8:
			get_tree().quit()
