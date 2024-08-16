extends Node2D

func _on_area_2d_body_entered(body):
	if body is Pirahna or body is Octopus:
		body.health -= 10
		queue_free()

func _physics_process(delta):
	position += transform.x * delta * 100
