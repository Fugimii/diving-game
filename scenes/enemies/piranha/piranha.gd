extends RigidBody2D

@onready var anim_sprite = $AnimatedSprite2D
@onready var attack_area = $AttackArea
@onready var player = $"../../Player"

@onready var mode = 0

const DAMAGE = 10

func _ready():
	var wait_time = randf_range(1.5, 3.4)
	while true:
		if mode == 0:
			# This is horribly done
			linear_velocity.x = 10
			anim_sprite.animation = "right"
			await get_tree().create_timer(wait_time).timeout
			linear_velocity.x = -10
			anim_sprite.animation = "left"
			await get_tree().create_timer(wait_time).timeout
		elif mode == 1:
			anim_sprite.animation = "attack"
			#print(player.position)
			#rotation = 90

func _on_attack_area_body_entered(body):
	if body is Player:
		mode = 1
		player.health -= DAMAGE
