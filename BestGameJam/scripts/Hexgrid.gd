extends Node

const TILE_SIZE := 1.0
const HEX_TILE = preload("res://HexTile.tscn")

@export_range(2, 20, 1) var grid_size : int = 10

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_generate_grid()

func _generate_grid():
	for x in range(grid_size):
		var tile_coordinates := Vector2.ZERO
		tile_coordinates.x = x * TILE_SIZE * cos(deg_to_rad(30))
		tile_coordinates.y = 0 if x % 2 == 0 else TILE_SIZE/2
		for y in range(grid_size):
			var tile = HEX_TILE.instantiate()
			add_child(tile)
			tile.translate(Vector3(tile_coordinates.x,0, tile_coordinates.y))
			tile_coordinates.y += TILE_SIZE
