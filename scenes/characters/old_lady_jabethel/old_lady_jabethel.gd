extends RigidBody2D

@onready var animSprite = $AnimatedSprite2D

func _ready():
	# This is horribly done
	while true:
		linear_velocity.x = 10
		animSprite.animation = "walk_right"
		await get_tree().create_timer(15.0).timeout
		linear_velocity.x = -10
		animSprite.animation = "walk_left"
		await get_tree().create_timer(15.0).timeout
