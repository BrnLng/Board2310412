extends Node2D

@export var tile_config : TileResourceBase

func _ready():
	var base_pos : Vector2i
	if tile_config.cell_size == Vector2i.ZERO:
		tile_config.reset()
	
	for i in range(get_child_count()):
		var tile = get_child(i) as Node2D
		if i == 0:
			base_pos = tile.global_position
		
		tile.global_position = Vector2i(tile_config.hex_snapped(base_pos, tile.global_position))
		# .snapped(Vector2i(tile_config.cell_size)))  # + base_pos ?
