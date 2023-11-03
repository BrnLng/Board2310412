extends Node2D

@onready var label = $Label
var current_tile_part_toggle := 0

func _ready():
	S.connect("tile_over", update_label)

func _process(delta):
	if Input.is_action_just_released("ui_right"):
		current_tile_part_toggle = (current_tile_part_toggle + 1) % GC.SELECTS.size() as GC.SELECTS
		print_debug(current_tile_part_toggle)
		S.tile_change_part_focus.emit(current_tile_part_toggle)

func update_label(msg:String):
	label.text = msg
