extends ColorRect

var circle_size = 1.0

func update_transition_shader():
	material.set_shader_parameter("screen_width", get_viewport_rect().size.x)
	material.set_shader_parameter("screen_height", get_viewport_rect().size.y)
	material.set_shader_parameter("circle_size", circle_size)

func transition():
	circle_size = -1.0

func _process(delta):
	update_transition_shader()
	circle_size += 0.5 * delta
	
