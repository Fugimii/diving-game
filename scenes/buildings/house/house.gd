extends StaticBody2D

@onready var sprite = $BottomHouse

func _on_door_area_2d_body_entered(body):
	if body is CharacterBody2D:
		sprite.frame = 1

func _on_door_area_2d_body_exited(body):
	if body is CharacterBody2D:
		sprite.frame = 0
