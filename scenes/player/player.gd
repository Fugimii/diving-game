extends CharacterBody2D
class_name Player

const SPEED = 50.0

@export var teleporting = false
@onready var circle_shader_rect = $UI/ShaderRect
@export var circle_size = -1.0

@export var can_move = true

@onready var cam = $Camera2D
@onready var anim_sprite = $AnimatedSprite2D

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	if can_move:
		input_vector = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
		velocity = input_vector * SPEED
	handle_animations()
	
	move_and_slide()

func _process(delta):
	if teleporting:
		circle_size += 0.5*delta
	update_circle_shader()

func update_circle_shader():
	circle_shader_rect.material.set_shader_parameter("screen_width", get_viewport_rect().size.x)
	circle_shader_rect.material.set_shader_parameter("screen_height", get_viewport_rect().size.y)
	circle_shader_rect.material.set_shader_parameter("circle_size", circle_size)

func handle_animations():
	if Input.is_action_pressed("move_left"):
		anim_sprite.play("walk_left")


	if Input.is_action_pressed("move_right"):
		anim_sprite.play("walk_right")
	
	if Input.is_action_pressed("move_up"):
		anim_sprite.play("walk_up")


	if Input.is_action_pressed("move_down"):
		anim_sprite.play("walk_down")

	else:
		anim_sprite.stop()
