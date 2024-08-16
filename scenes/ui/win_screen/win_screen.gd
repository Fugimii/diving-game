extends Node2D

@onready var girl = $Girl
@onready var boy = $Girl/Boy
var stop = true

func _ready():
	await get_tree().create_timer(5.0).timeout
	stop = false

func _physics_process(delta):
	if not stop:
		girl.play()
		boy.play()
		girl.position.y += 10 * delta

func _on_timer_timeout():
	stop = true
	girl.stop()
	boy.stop()
	$UI/DialougeControl/MarginContainer/VSplitContainer/DialogueBox.start("win_screen")

func _on_dialogue_box_dialogue_ended():
	get_tree().quit()
