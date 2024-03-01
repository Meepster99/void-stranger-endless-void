if ds_map_find_value(async_load, "id") == get_levels
{
    online_levels_str = ds_map_find_value(async_load, "result");
	if (online_levels_str != "" && !is_undefined(online_levels_str))
		global.online_levels = string_split_buffer(online_levels_str, ",", 512)
	else
		global.online_levels = []
	show_debug_message(global.online_levels)
	with (asset_get_index("obj_ev_level_select"))
		on_online_update();
	with (asset_get_index("obj_ev_refresh_window"))
		on_online_update();	
	
	if (room == global.startup_room)
		startup_actions_count--;
}
if ds_map_find_value(async_load, "id") == validate_levels
{
    if ds_map_find_value(async_load, "status") == 0 {
		var result = ds_map_find_value(async_load, "result");
		show_debug_message(result)
		on_server_validate_startup(result)
    }
	if (room == global.startup_room)
		startup_actions_count--;
}