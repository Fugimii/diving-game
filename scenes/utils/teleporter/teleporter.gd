extends Area2D
class_name Teleporter

var can_teleport = true # Whether the teleporter is able teleporting the player, gets set to true when the player exits the area2D

@onready var collider = $CollisionShape2D

@export var portal_id : String
@export var wait_time = 2.0

@export var collison_shape : Shape2D :
	set(value):
		collison_shape = value
		if is_node_ready():
			collider.shape = collison_shape

func _on_body_entered(body):
	if body is Player:
		var other_portal = find_other_portal(portal_id)
		if other_portal and can_teleport: # Make sure it found another portal
			other_portal.can_teleport = false
			body.can_move = false # Stop the player from moving
			body.circle_size = -1.0
			body.teleporting = true
			await get_tree().create_timer(2.0).timeout # Wait 2 seconds
			body.position = other_portal.global_position # Teleport the player
			body.teleporting = false
			body.can_move = true # Let the player move
			body.circle_size = 0.0
			body.update_circle_shader()
			await get_tree().create_timer(0.5).timeout # Wait 2 seconds
			body.teleporting = true
			await get_tree().create_timer(2.0).timeout # Wait 2 seconds
			body.teleporting = false

func find_other_portal(id):
	for child in get_parent().get_children():
		if child is Teleporter:
			if child.portal_id == id and not child == self:
				return(child)
				
	push_warning("Other portal with ID " + id + " not found")

func _on_body_exited(_body):
	can_teleport = true

func _on_teleport_timer_timeout():
	pass # Replace with function body.
