extends Node2D

@onready var sprite = $Sprite
@onready var area = $Area
@onready var hex_face = $Area/HexFace
@onready var hex_vertex_group = [$Area/HexVertexN, $Area/HexVertexNW]
@onready var hex_edge_group = [$Area/HexEdgeNW, $Area/HexEdgeNE, $Area/HexEdgeW]

var _current_select : GC.SELECTS

func _ready():
	for hex_area in $Area.get_children():
		hex_area.visible = true
	update_select(GC.SELECTS.FACE)
	S.tile_change_part_focus.connect(update_select)
#	$Area.mouse_shape_entered.connect(_on_area_shape_entered, [shape_idx?])

func update_select(new_part:GC.SELECTS):
	_current_select = new_part
	match new_part:
		GC.SELECTS.FACE:
#			$Area/HexFace.visible = true
			$Area/HexFace.set_deferred("disabled", false)
			$Area/HexEdgeW.set_deferred("disabled", true)
			$Area/HexEdgeNE.set_deferred("disabled", true)
			$Area/HexEdgeNW.set_deferred("disabled", true)
			$Area/HexVertexN.set_deferred("disabled", true)
			$Area/HexVertexNW.set_deferred("disabled", true)
		GC.SELECTS.EDGE:
			$Area/HexFace.set_deferred("disabled", true)
			$Area/HexEdgeW.set_deferred("disabled", false)
			$Area/HexEdgeNE.set_deferred("disabled", false)
			$Area/HexEdgeNW.set_deferred("disabled", false)
			$Area/HexVertexN.set_deferred("disabled", true)
			$Area/HexVertexNW.set_deferred("disabled", true)
		GC.SELECTS.VERTEX:
			$Area/HexFace.set_deferred("disabled", true)
			$Area/HexEdgeW.set_deferred("disabled", true)
			$Area/HexEdgeNE.set_deferred("disabled", true)
			$Area/HexEdgeNW.set_deferred("disabled", true)
			$Area/HexVertexN.set_deferred("disabled", false)
			$Area/HexVertexNW.set_deferred("disabled", false)

func _on_area_shape_entered(shape_idx):
	S.tile_over.emit("mouse entered " + _print_select_part() + " @ " + _print_select_name())
	sprite.modulate = Color.YELLOW
	print_debug(shape_idx)

func _on_mouse_entered():  # deprecated
#	print_debug("mouse entered " + name)
	S.tile_over.emit("mouse entered " + _print_select_part() + " @ " + _print_select_name())
	sprite.modulate = Color.YELLOW

func _print_select_part() -> String:
	match _current_select:
		GC.SELECTS.FACE:
			return "face"
		GC.SELECTS.EDGE:
			return "side"
		GC.SELECTS.VERTEX:
			return "point"
	return "err 231102:56"

func _print_select_name() -> String:
	match _current_select:
		GC.SELECTS.FACE:
			return name
		GC.SELECTS.EDGE:
			return name + " & some next hex"
		GC.SELECTS.VERTEX:
			return name + " & some next hexes"
	return "err 231102:56"
