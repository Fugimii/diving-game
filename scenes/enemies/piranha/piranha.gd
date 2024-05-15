extends RigidBody2D

@onready var anim_sprite = $AnimatedSprite2D

func _ready():
	var wait_time = randf_range(1.5, 3.4)
	while true:
		# This is horribly done
		linear_velocity.x = 10
		anim_sprite.animation = "right"
		await get_tree().create_timer(wait_time).timeout
		linear_velocity.x = -10
		anim_sprite.animation = "left"
		await get_tree().create_timer(wait_time).timeout
