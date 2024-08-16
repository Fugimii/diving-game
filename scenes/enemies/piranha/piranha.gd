extends CharacterBody2D
class_name Pirahna

@export var health = 40 :
	set(value):
		health = value
		if health <= 0:
			queue_free()

@onready var anim_sprite = $AnimatedSprite2D
@onready var attack_range = $AttackRange
@onready var player: Player

@onready var mode = 0

const DAMAGE = 10

func _ready():
	while mode == 0:
			velocity.x = 10
			anim_sprite.play("right")
			await get_tree().create_timer(3.0).timeout
			anim_sprite.play("left")
			velocity.x = -10
			await get_tree().create_timer(3.0).timeout

func _physics_process(delta)	:
	if player:
		look_at(player.position)
		velocity = transform.x * 25
		anim_sprite.animation = "attack"
	move_and_slide()

func _on_attack_range_body_entered(body):
	if body is Player:
		player = body


func _on_attack_body_entered(body):
	if body is Player:
		body.health -= 15
