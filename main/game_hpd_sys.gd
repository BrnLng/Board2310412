extends Node

#var context := {
#	"control_turn" : {
#		"index" : 0,
#		"total" : -1,  # indeterminate
#	},
#	"control_player" : {
#		"index" : 0,
#		"total" : 1,
##		"auto" : 0,
#	},
#	"game" : {
#		# per player
#		-1 : {  # open/all
#
#		},
#		0 : {
#			"action_points" : 2,
#		},
#	},
#}

var control_turn_total := -1  # indeterminate
var control_turn_index := 0
var control_player_total := 1
var control_player_index := 0
var players_action_points = 2

func _ready():
#	print_debug(get_context(0))
	pass

#func get_context(visibility_filter:int) -> Dictionary:
#	var visible_context = context
#	return visible_context
