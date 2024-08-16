extends CharacterBody2D
class_name Octopus

@export var health = 500 :
	set(value):
		health = value
		if health <= 500/2:
			attack_time = 2.5
		if health <= 0:
			get_tree().change_scene_to_file("res://scenes/ui/win_screen/win_screen.tscn")

@onready var attack_time = 5.0
@onready var attack_area = $Area2D
@onready var player = $"../../Player"

var speed = 40
var attack_position := Vector2(-2045, -2509)

func _ready():
	await get_tree().create_timer(3.0).timeout
	# This is horribly done
	while true:
		attack_position = player.position
		await get_tree().create_timer(attack_time).timeout

func _physics_process(delta):
	var overlaps = attack_area.get_overlapping_bodies()
	for overlap in overlaps:
		if overlap is Player:
			overlap.health -= 20.0 * delta
	
	if health > (250/2):
		position += transform.x.rotated(get_angle_to(attack_position)) * speed * delta
	else: 
		look_at(player.position)
		speed = 55
		attack_time = 1.5
		rotation_degrees += 90
		$AnimatedSprite2D.play("attack")
		position += transform.x.rotated(get_angle_to(attack_position)) * speed * 2 *delta
		
	move_and_slide()
