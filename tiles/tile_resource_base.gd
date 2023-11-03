extends Resource
class_name TileResourceBase

@export var tile_texture: Texture2D
var cell_size: Vector2i

func _init(_tile_texture = null):
	if not _tile_texture:
		cell_size = Vector2i.ZERO
	else:
		cell_size = tile_texture.get_size().snapped(Vector2i(1,1))

func reset():
	cell_size = tile_texture.get_size()
	print_debug(cell_size)

func hex_snapped(base_pos: Vector2i, pos : Vector2i) -> Vector2i:
	return pos
#	return base_pos / 4 + pos
