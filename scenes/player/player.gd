extends CharacterBody2D
class_name Player

var SPEED = 50.0

@onready var trident_file = load("res://scenes/player/trident.tscn")
@export var teleporting = false
@onready var circle_shader_rect = $UI/ShaderRect
@export var circle_size = -1.0

@onready var can_trident = true
@export var can_move = true
@export var diving_suit_enabled = false : 
	set(value):
		diving_suit_enabled = value
		$Underwater/AudioStreamPlayer2D.play()

@export var health = 100.0 :
	set(value):
		health = value
		$UI/HealthControl/HSlider.value = health
		if health < 1:
			get_tree().change_scene_to_file("res://scenes/ui/lose_screen/lose_screen.tscn")

@onready var cam = $Camera2D
@onready var overworld_node = $Overworld
@onready var underwater_node = $Underwater
@onready var normal_sprite = $Overworld/NormalSprite
@onready var diving_sprite = $Underwater/DivingSprite
@onready var dialouge_box = $UI/DialougeControl/MarginContainer/VSplitContainer/DialogueBox
@onready var dialouge_area = $DialougeArea

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
	if Input.is_action_pressed("move_down"):
		normal_sprite.play("walk_down")
		diving_sprite.play("walk_down")
		
	elif Input.is_action_pressed("move_up"):
		normal_sprite.play("walk_up")
		diving_sprite.play("walk_up")
	
	elif Input.is_action_pressed("move_left"):
		normal_sprite.play("walk_left")
		diving_sprite.play("walk_left")
	
	elif Input.is_action_pressed("move_right"):
		normal_sprite.play("walk_right")
		diving_sprite.play("walk_right")
	
	else:
		normal_sprite.stop()
		diving_sprite.stop()
		normal_sprite.frame = 0
		diving_sprite.frame = 0
	
	if diving_suit_enabled:
		$Overworld/AudioStreamPlayer2D.stop()
		SPEED = 32.0
		overworld_node.hide()
		underwater_node.show()

func _input(event):
	if event.is_action_pressed("interact"):
		if dialouge_box.is_running(): # Is some dialouge already open?
			pass
		else:
			for body in dialouge_area.get_overlapping_bodies():
				if body is dialogue_interactable:
					dialouge_box.start(body.dialouge_id)
					break
	
	if event.is_action_pressed("click"):
		if diving_suit_enabled and can_trident:
			$TridentTimer.start()
			can_trident = false
			var trident = trident_file.instantiate()
			get_parent().add_child(trident)
			trident.position = position
			trident.look_at(get_global_mouse_position())

func _on_trident_timer_timeout():
	can_trident = true
