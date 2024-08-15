extends CharacterBody2D

@onready var anim_sprite = $AnimatedSprite2D
@onready var attack_range = $AttackRange
@onready var player: Player

@onready var mode = 0

const DAMAGE = 10

func _physics_process(delta)	:
	if player:
		look_at(player.position)
		velocity = transform.x * 25
	move_and_slide()

func _on_attack_range_body_entered(body):
	if body is Player:
		anim_sprite.animation = "attack"
		player = body
