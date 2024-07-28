extends RigidBody2D
class_name dialogue_interactable

@onready var animSprite = $AnimatedSprite2D

@export var dialouge_id: String

func _ready():
	# This is horribly done
	while true:
		linear_velocity.y = -6.5
		animSprite.play("walk_up")
		await get_tree().create_timer(15.0).timeout
		linear_velocity.y = 7.5
		animSprite.play("walk_down")
		await get_tree().create_timer(15.0).timeout
