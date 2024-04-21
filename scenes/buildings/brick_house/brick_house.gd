extends StaticBody2D

@onready var anim_sprite = $MainHouseSprite

func _on_door_open_area_2d_body_entered(body):
	if body is Player:
		anim_sprite.frame = 1

func _on_door_open_area_2d_body_exited(body):
	if body is Player:
		anim_sprite.frame = 0
