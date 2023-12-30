function ev_mouse_held() {
	return global.mouse_held
}
function ev_mouse_pressed() {
	return global.mouse_pressed
}

function ev_mouse_right_held() {
	return global.mouse_right_held
}
function ev_mouse_right_pressed() {
	return global.mouse_right_pressed
}


function ev_mouse_released() {
	return mouse_check_button_released(mb_left)
}
function ev_is_mouse_on_me() {
	if layer_num != global.mouse_layer
		return false
	var list = ds_list_create()
	var length = instance_position_list(mouse_x, mouse_y, all, list, false)
	var min_depth = infinity
	var min_inst = noone
	for (var i = 0; i < length; i++) {
		var inst = list[| i]
		if (inst.depth < min_depth) {
			min_inst = inst
			min_depth = inst.depth	
		}
	}
	ds_list_destroy(list)
	return min_inst == id
}

// This section will be patched while merging with Void Stranger to utilize its input system.

function ev_is_action_pressed() {
	return keyboard_check_pressed(ord("Z"))
}
function ev_is_action_held() {
	return keyboard_check(ord("Z"))
}
function ev_get_action_key() {
	return ord("Z")
}
function ev_get_horizontal_pressed() {
	return keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left)
}
function ev_get_vertical_pressed() {
	return keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up)
}