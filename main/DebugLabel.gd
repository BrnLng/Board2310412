extends Label


var msg_hist := []
var index := -1


func text_update(new_msg: String) -> void:
	msg_hist.append(new_msg)
	text = new_msg
	index = -1


func show_history(move_index: int) -> void:
	index += move_index
	if is_index_valid(index):
		text = str(index*-1-1) + ": " + msg_hist[index]  # normalizing index for UI readability
	else:
		index -= move_index


func _process(_delta):
	if Input.is_action_just_released("ui_up"):
		show_history(-1)
	elif Input.is_action_just_released("ui_down"):
		show_history(1)


func is_index_valid(index: int) -> bool:
	var array_size = msg_hist.size()
	return index >= -1 * array_size and index < 0  # was array_size insteadOf 0 -- only up
