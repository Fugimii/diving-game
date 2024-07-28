@tool
extends Node2D

@onready var tilemap = $Tilemapx

@export var generate: bool : 
	set(newValue):
		generate = false
		generate_map()

@export var noise: Noise
@export var threshold: float

@export var width: int
@export var height: int

func _ready():
	generate_map()

func generate_map():
	tilemap.clear()
	
	for x in range(width): # Set the background to the floor tile
		for y in range(height):
			tilemap.set_cell(0, Vector2i(x, y), 2, Vector2i(18, 4))
	
	for x in range(width):
		for y in range(height):
			var noise_height = noise.get_noise_2d(x, y)
			if threshold < noise_height:
				tilemap.set_cell(0, Vector2i(x, y), 2, Vector2i(18, 8))
