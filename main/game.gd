extends Node2D

@onready var debug_label = $DebugLabel
var current_tile_part_toggle := 0

func _ready():
	S.connect("tile_over", update_debug_label)
	S.connect("update_debug_label", update_debug_label)

func _process(_delta):
	if Input.is_action_just_released("ui_right"):
		current_tile_part_toggle = (current_tile_part_toggle + 1) % GC.SELECTS.size() as GC.SELECTS
#		print_debug(current_tile_part_toggle)
		S.tile_change_part_focus.emit(current_tile_part_toggle)

func update_debug_label(msg:String):
	debug_label.text_update(msg)
