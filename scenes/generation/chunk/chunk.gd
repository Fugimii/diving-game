@tool
extends Node2D

@export var noise : Noise :
	set(value):
		noise = value
		generate()

@export var noise_threshold = 0.5 :
	set(value):
		noise_threshold = value
		generate()

@export var width = 64 :
	set(value):
		width = value
		generate()

@export var height = 64 :
	set(value):
		height = value
		generate()

@onready var tilemap = $TileMap

func generate():
	if tilemap:
		tilemap.clear()
		tilemap.set_cell(0, Vector2i(0, 0), 2, Vector2i.ZERO, 0)
		for x in range(width):
			for y in range(height):
				var noise_height = noise.get_noise_2d(x, y)
				
				if noise_height > noise_threshold:
					tilemap.set_cell(0, Vector2i(x, y), 2, Vector2i.ZERO, 0)
