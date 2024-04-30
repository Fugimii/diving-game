extends Node2D

@export var noise : Noise
@export var noise_threshold = 0.5
@export var width = 64
@export var height = 64

@onready var tilemap = $TileMap

func _ready():
	tilemap.set_cell(0, Vector2i(0, 0), 0, Vector2i.ZERO, 0)
	for x in range(width):
		for y in range(height):
			var noise_height = noise.get_noise_2d(x, y)
			
			if noise_height > noise_threshold:
				print("HI :D")
				tilemap.set_cell(0, Vector2i(x, y), 0, Vector2i.ZERO, 0)
